<?php


class Sec extends MX_Controller {

    public function __construct()
    {
        parent::__construct();

        $this->load->model(array('LicenceModel', 'sec/LicenceModel'));

        $this->load->helper(array('form', 'url'));
        $this->load->library('form_validation');
    }
    function boolisoft_licence()
    {
        $this->load->view('sec/madina');
    }
    function addLicence(){
        $this->LicenceModel->insertSerialOnDatabase();
    }
    function valid(){
        $this->form_validation->set_rules('licence', 'licence', 'required');
        $this->form_validation->set_rules('secret', 'secret', 'required');

        $licence = $this->input->post('licence');
        $keypost = $this->input->post('secret');

        //Vérifier l'entrée de la clé de licence entrée par l'utilisateur avec celle déjà générée
        //Si ce n'est pas les mêmes clés, demander à nouveau une saisie ou contacter le devéloppeur
        $q = $this->db->get('madina_table');
        /* if u r fetching one row use row_array instead of result_array*/
        $rowmac = $q->row_array();

        $mac= $rowmac['user_mac'];

        $q2 = $this->db->get('madina_table');
        /* if u r fetching one row use row_array instead of result_array*/
        $rowkey = $q2->row_array();

        $key= $rowkey['secretkey'];
        //Décrypter avant la comparaison
        $ciphering = "AES-128-CTR";

        $options = 0;
        $decryption_iv = '1234567891011121';
        $decryption_key = "xyzboolisoftdevtofrboboc";

        //Décrypter le serial de la base de données

        $decryptionmac=openssl_decrypt ($mac, $ciphering, $decryption_key, $options, $decryption_iv);


        //Décrypter la clé secrète

        $decryptionkey=openssl_decrypt ($key, $ciphering, $decryption_key, $options, $decryption_iv);
        //Valider les entrées
        if (preg_replace('/\s+/', ' ', trim($decryptionmac))===preg_replace('/\s+/', ' ', trim($licence))&&preg_replace('/\s+/', ' ', trim($decryptionkey))===preg_replace('/\s+/', ' ', trim($keypost))) {
            echo "<h3 style='color:green'>Félicitation votre licence est activée et ceci à vie, si vous le perdez vous avez droit à 3 changements mais vous paierai pour un 4ème changement. Et cette licence est unique pour un pc.<a href='http://localhost'>Cliquez ici pour commencer à utiliser complètement le logiciel</a></h3>";
            $encryption_key = "xyzboolisoftdevtofrboboc";
            $text = "1";
            $encrypted = bin2hex(openssl_encrypt($text, 'AES-128-CBC', $encryption_key));
            $this->db->update('madina_table',array('status'=>$encrypted));
        }else{
            echo "<h3 style='color:red'>Mauvaise clé de licence/clé secrète ! veuillez réessayer ou contacter le développeur<a href='sec/boolisoft_licence'>Cliquez ici pour pour réessayer</a></h3>";
            $this->db->update('madina_table', array('status' => '0'));
            redirect('sec/boolisoft_licence');
        }
    }
}
{

}

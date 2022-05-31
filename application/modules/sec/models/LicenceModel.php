<?php


class LicenceModel extends CI_Model{

    public function insertSerialOnDatabase() {
        //Enregistrer la clé secrète, le numéro de série final dans la base de données

        //Générer la clé finale
        $charactersRight = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($charactersRight);
        $randomStringRight = '';
        for ($i = 0; $i < 2; $i++) {
            $randomStringht .= $charactersRight[rand(0, $charactersLength - 1)];
        }

        $charactersLeft = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($charactersLeft);
        $randomStringLeft = '';
        for ($i = 0; $i < 2; $i++) {
            $randomStringLeft .= $charactersLeft[rand(0, $charactersLength - 1)];
        }


        $serial = shell_exec("wmic bios get serialnumber | findstr /V SerialNumber 2>&1");

        $sn = "$serial$randomStringLeft";
        $pool = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        $countPool = strlen($pool) - 1;
        $totalChars = 12;

        for ($i = 0; $i < $totalChars; $i++) {
            $currIndex = mt_rand(0, $countPool);
            $currChar = $pool[$currIndex];
            $key .= $currChar;
        }
        // Store the cipher method
        $ciphering = "AES-128-CTR";

// Use OpenSSl Encryption method
        $iv_length = openssl_cipher_iv_length($ciphering);
        $options = 0;

// Non-NULL Initialization Vector for encryption
        $encryption_iv = '1234567891011121';

// Store the encryption key
        $encryption_key = "xyzboolisoftdevtofrboboc";
        // Use openssl_encrypt() function to encrypt the data
        $encryption = openssl_encrypt($sn, $ciphering,
            $encryption_key, $options, $encryption_iv);

        $encrypkey = openssl_encrypt($key,$ciphering,
            $encryption_key, $options, $encryption_iv);

        $encryption_keystat = "xyzboolisoftdevtofrboboc";

        $text="0";
        $encrypted = bin2hex(openssl_encrypt($text, 'AES-128-CBC', $encryption_key));

        //En guise de test
        // Non-NULL Initialization Vector for decryption
        $decryption_iv = '1234567891011121';

// Store the decryption key
        $decryption_key = "xyzboolisoftdevtofrboboc";

// Use openssl_decrypt() function to decrypt the data
        $decryption=openssl_decrypt ($encryption, $ciphering,
            $decryption_key, $options, $decryption_iv);
        $pass=openssl_decrypt ($encrypkey, $ciphering,
            $decryption_key, $options, $decryption_iv);

// Display the decrypted string
        $userlicence = array(
            'user_mac'   => trim($encryption),
            'status'  => trim($encrypted),
            'secretkey'  => trim($encrypkey),
        );

        //Insérer les données cryptées puis produire un zip contenant ces deux clés
       $this->db->select('*');
       $this->db->from('madina_table');
       $q = $this->db->get();
       //Insérer les données que si et seulement si il n'y a pas déjà un inséré
       if ($q->num_rows()<1) {
           $this->db->insert('madina_table',$userlicence);

           //Produire deux fichier texte contenant le serial et le secretkey puis les mettre dans un seul zip
           $file = "licence.boolisoft";
           $txt = fopen($file, "w") or die("Unable to open file!");
           fwrite($txt, $encryption);
           fclose($txt);

           $filekey = "key.boolisoft";
           $txtkey = fopen($filekey, "w") or die("Unable to open file!");
           fwrite($txtkey, $encrypkey);
           fclose($txtkey);

           //Maintenant créer un fichier zip et sauvegarder les deux fichiers à l'intérieur
           $zip = new ZipArchive();
           $filename = "licence.zip";
           if ($zip->open($filename, ZipArchive::CREATE)!==TRUE) {
               exit("Impossible d'ouvrir le fichier <$filename>\n");
           }

           $zip->addFile($file);
           $zip->addFile($filekey);
           $code = $zip->setPassword('secret');

           if ($code === true)
               echo 'Le zip est maintenant disponible pour envoyer au développeur<br><br>';
           else
               echo $code.'<br>';

           $code = $zip->close();
           if ($code === true)
               echo 'En attendant la clé de licence, vous sériez toujours en mode démo<br><br>';
           else
               echo $code.'<br>';

           echo 'Cliquez <a href="http://localhost">ICI</a> pour retourner sur le logiciel et espérer la clé, dès que le développeur vous envoie les informations mettez selon les spécifications et activez le logiciel.<br><br>';
           echo "\x20\x20\x20";
           echo "Ou copier ces deux textes numéro de série et clé secrète et envoyez au développeur au (+33)766795374 ou juste 0766795374<br><br>";
           echo "\x20\x20\x20";
           echo "Numero de série : ".$encryption;
           echo "<br><br><br>";

           echo "clé secrète : ".$encrypkey;
           echo "<br><br><br>";
           //Supprimer les fichiers textes générés
           unlink($file,$filekey);

           echo "OU juste vous pouvez aussi envoyer le fichier licence.zip au développeur pour obtenir votre clé de licence ou juste appelez le technicien pour le faire à votre place<br><br>";
           exit;
       }else{
           echo "vous avez déjà une clé de licence, envoyez le zip au développeur avec votre nom de société comme indicatif pour vous envoyer la clé<a href='http://localhost'>Cliquez ici pour retournez sur le logiciel</a>";
           //Supprimer une licence si vous remarquez deux à l'intérieur
       }

   }

   public function searchLicenceInformation(){
       //Recherchez toujours au démarrage si la clé de licence existe toujours,
       //Sinon générer une nouvelle
       return $this->db->select('*')
           ->from('madina_table')
           ->get()
           ->result();
   }
    public function verifyActivatedLicence(){
        //Vérifier voir si la licence est activée, sinon continuer en mode démo avec le blocage de fonctionnalités
    }
  public function avoidCopy(){
            //Empêcher que l'utilisateur copie le logiciel et le lance avec sa base de donnée sur un
            //autre ordinateur
  }

  public function validUserLience(){
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
         //Recupérer la saisie de l'utilisateur pour comparer


        //La clé de licence saisie par l'utilisateur
          $licence= $this->input->post('licence');

          //La clé secrète
          $clesecrete =$this->input->post('secret');

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
      echo "input".$licence;
      if (trim($licence)==trim($decryptionmac)) {
         echo "c'est une bonne clé de licence";
      }
      if ($clesecrete==$decryptionkey) {
         echo "c'est une bonne clé secrète";
      }

  }
}
{

}

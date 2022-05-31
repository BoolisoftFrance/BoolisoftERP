
<html>
<head>
    <title>Activation du logiciel</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />

    <style>
        body {
            background-color: #f5f5f5 !important;
            height: 100vh !important;
        }

        .wrapper1 {
            height: 100vh !important;
            display: flex;
            align-items: center;
            flex-direction: column;
            justify-content: center;
            width: 100%;
            padding: 20px;
        }

        .logincontainer {
            border-radius: 0px !important;
            background: #fff;
            width: 90%;
            max-width: 450px;
            position: relative;
            padding: 20px;
            border: 1px white solid;
            box-shadow: 0 15px 10px -10px rgba(31, 31, 31, 0.5);
            text-align: center;
        }


    </style>
</head>
<body>
        <div class="wrapper1">

            <div class="logincontainer">
                <h3>ACTIVATION</h3>
                <label style="color: red;font-family: 'Segoe UI'">Cliquez sur le bouton ci-dessous en orange pour obtenir votre clé et l'envoyer au développeur par telegram, email ou whatsapp pour pouvoir vous donner la clé d'activation, un fichier zip licence.zip serait produit dans le repertoire www de l'application, vous dévriez le copier et envoyer comme indiqué. E-mail : boolisoftdev@gmail.com, whatsapp : (00228)90067039 ou +33766795374</label>
                <hr />

                <form method="post" action="<?php echo site_url('sec/valid')?>">
                    <label for="licence">Licence</label>
                <input name="licence" type="text" class="form-control" placeholder="Entrez votre code de licence" required/>
                <br />
                    <label for="secret">Clé secrète</label>
				<input name="secret" type="text" class="form-control" placeholder="Coller ici le code secret" required/>
                <br />
                <button class="btn btn-info form-control" type="submit">Activer maintanant</button>
                <a style="size: 25px">ou</a>
                <br>
                <br>
                <a href="<?php echo site_url('sec/addLicence')?>" target="_self" style="color: white" type="button" class="btn btn-warning form-control">Cliquez ici pour récupérer votre clé de licence</a>
                </form>
            </div>

        </div>

</body>
</html>

 <div class="row">
            <div class="col-sm-12 col-md-12">
                <!-- Multiple panels with drag & drop -->
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('csv_file_informaion')?></h4>
                        </div>
                    </div>
                    <div class="panel-body">
                       <a href="<?php echo base_url('assets/data/csv/sample_product .csv') ?>" class="btn btn-primary pull-right"><i class="fa fa-download"></i> Download Sample File</a>
                            <span class="text-warning">The first line in downloaded csv file should remain as it is. Please do not change the order of columns.</span><br>The correct column order is <span class="text-info">(Serial No,Supplier Name, Product Name, Product Model,Category Name ,Sale Price,Supplier Price  Product Variants separated by vertical bar)</span> &amp; you must follow this.<br>Please make sure the csv file is UTF-8 encoded and not saved with byte order mark (BOM).<p>The images should be uploaded in <strong>uploads</strong> folder.</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo display('import_product_csv') ?></h4>
                        </div>
                    </div>
                     <?php echo form_open_multipart('product/product/uploadCsv',array('class' => 'form-vertical', 'id' => 'validate','name' => 'insert_product'))?>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <label for="upload_csv_file" class="col-sm-4 col-form-label"><?php echo display('upload_csv_file') ?> <i class="text-danger">*</i></label>
                                    <div class="col-sm-8">
                                        <?php if(empty($limit)):?>
                                            <input type="submit" id="add-product" class="btn btn-primary btn-large"
                                                   name="add-product" value="<?php echo display('save') ?>" tabindex="10"/>
                                        <?php else : ?>
                                            <?php if (!empty($limit)):?>
                                                <?php foreach ($limit as $lim) :?>
                                                    <?php if ($lim->demo < 3) :?>
                                                        <input class="form-control" name="upload_csv_file" type="file" id="upload_csv_file" placeholder="<?php echo display('upload_csv_file') ?>" required>
                                                    <?php else : ?>
                                                        <?php if(empty($licence)):?>
                                                            <?php if($lim->demo < 3):?>
                                                                <input type="submit" id="add-product" class="btn btn-primary btn-large"
                                                                       name="add-product" value="<?php echo display('save') ?>" tabindex="10"/>
                                                            <?php else : ?>
                                                                <p style="color: red">Vous ne pouvez plus ajouter un produit car vous avez atteint
                                                                    le nombre maximal fixé pour la version démo, veuillez activer le produit en
                                                                    suivant ce lien <a href="<?php echo site_url('sec/boolisoft_licence'); ?>">Activer</a>
                                                                </p>
                                                            <?php endif;?>

                                                        <?php else:?>
                                                            <?php if (!empty($licence)) :?>
                                                                <?php foreach ($licence as $li):?>
                                                                    <?php
                                                                    $ciphering = "AES-128-CTR";

                                                                    $decryption_key = "xyzboolisoftdevtofrboboc";
                                                                    $statuss=$li->status;
                                                                    $decrypted = openssl_decrypt(hex2bin($statuss), 'AES-128-CBC', $decryption_key);
                                                                    ?>
                                                                    <?php if($decrypted==0&&$lim->demo==3):?>

                                                                        <p style="color: red">Vous ne pouvez plus ajouter un produit car vous avez atteint
                                                                            le nombre maximal fixé pour la version démo, veuillez activer le produit en
                                                                            suivant ce lien <a href="<?php echo site_url('sec/boolisoft_licence'); ?>">Activer</a>
                                                                        </p>
                                                                    <?php elseif ($decrypted==1):?>
                                                                        <input class="form-control" name="upload_csv_file" type="file" id="upload_csv_file" placeholder="<?php echo display('upload_csv_file') ?>" required>
                                                                    <?php endif;?>

                                                                <?php endforeach;?>
                                                            <?php endif;?>
                                                        <?php endif;?>



                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            <?php endif; ?>
                                        <?php endif;?>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-6">
                                <input type="submit" id="add-product" class="btn btn-primary btn-large" name="add-product" value="<?php echo display('submit') ?>" />
                                <input type="submit" value="<?php echo display('submit_and_add_another') ?>" name="add-product-another" class="btn btn-large btn-success" id="add-product-another">
                            </div>
                        </div>
                    </div>
                    <?php echo form_close()?>
                </div>
            </div>
        </div>



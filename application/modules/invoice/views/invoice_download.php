
<style type="text/css">
    table {
        border-collapse: collapse;
        width: 100%;
        direction: rtl;

    }

    table, th, td {
        border: 1px solid black;
    }


</style>
<div class="printableArea" id="printableArea">

    <div class="firts_section" style="">
        <div class="first_section_left"  style="width: 45%; display: inline-block;">
           <img height="60px" src="<?php  echo $currency_details[0]['invoice_logo']; ?>" class="img-responsive" alt="">
            <address>
                <strong style="font-size: 20px; "><?php echo html_escape($company_info[0]['company_name']); ?></strong><br>
                <abbr><b><?php echo display('mobile') ?>:</b></abbr> <?php echo html_escape($company_info[0]['mobile']); ?><br>
                <abbr><b><?php echo display('email') ?>:</b></abbr> <?php echo html_escape($company_info[0]['email']); ?><br>
                <abbr><b><?php echo display('website') ?>:</b></abbr> <?php echo html_escape($company_info[0]['website']); ?><br>
            </address>
            <br>
        </div>
        <div class="first_section_middle" style="width: 10%; display: inline-block;">

        </div>
        <div class="first_section_right"  style="width: 35%; display: inline-block;">
            <h3 style="margin-top:0px;margin-bottom: 0px;height: 15px"><?php echo display('invoice'); ?></h3>
            <br>
            <br>
            <address>
                <abbr><b><?php echo display('invoice_no') ?>:</b></abbr> <?php echo html_escape($invoice_no) ?><br>
                <abbr><b><?php echo display('date') ?>:</b></abbr> <?php echo html_escape($final_date) ?><br>
                  <span class="label label-success-outline m-r-15"><?php echo display('billing_to') ?></span><br>
                <strong style="font-size: 20px; "><?php echo html_escape($customer_info[0]['customer_name']); ?> </strong><br>
                <?php echo html_escape($customer_info[0]['customer_address']); ?>
                <br>
                <?php if ($customer_info[0]['customer_mobile']) { ?>

                    <?php
                    echo html_escape($customer_info[0]['customer_mobile']);
                }
                ?>
                <br>
                <?php if ($customer_info[0]['customer_email']) { ?>

                    <?php echo html_escape($customer_info[0]['customer_email']); ?>
                <?php } ?>


            </address>
        </div>
    </div>
    <div class="">

            <div class="" >
                <table class="table table-striped" style="direction: rtl">

                    <thead>

<tr>
                                            <th class="text-center" style="background-color: lightgrey"><?php echo display('sl') ?></th>
                                            <th class="text-center" style="background-color: lightgrey"><?php echo display('product_name') ?></th>
                                              <th class="text-center" style="background-color: lightgrey"><?php  echo display('unit');
                                              ?></th
                                            <th class="text-right" style="background-color: lightgrey"><?php echo display('quantity') ?></th>
                                             <th class="text-right" style="background-color: lightgrey"><?php echo display('rate') ?></th>
                                            <?php if ($discount_type == 1) { ?>
                                                <th class="text-right" style="background-color: lightgrey"><?php echo display('discount_percentage') ?> %</th>
                                            <?php } elseif ($discount_type == 2) { ?>
                                                <th class="text-right" style="background-color: lightgrey"><?php echo display('discount') ?> </th>
                                            <?php } elseif ($discount_type == 3) { ?>
                                                <th class="text-right" style="background-color: lightgrey"><?php echo display('fixed_dis') ?> </th>
                                            <?php } ?>


                                            <th class="text-right" style="width: 100px; background-color: lightgrey"><?php echo display('ammount') ?></th>
                                        </tr>
                    </thead>
                    <tbody>
                    <?php
                                                $sl = 1;
                                                $amount = 0;
                                                foreach ($invoice_all_data as $item) {

                                                        ?>
                                                        <tr>
                                                            <td><?php echo $sl ?></td>
                                                            <td class="text-left" style="width: 270px"><?php echo html_escape($item['product_name']).' '; ?></td>
                                                               <td class="text-center"><div><?php echo html_escape($item['unit']) ;?></div></td>
                                                            <td align="right" style="padding-right:10px;"><?php echo html_escape($item['quantity']); ?></td>
                                                            <td align="right" style="padding-right:10px;">
                                                                <?php
                                                                $rate = html_escape($item['rate']);
                                                                echo (($position == 0) ? "$rate" : "$rate ");
                                                                ?>
                                                            </td>
                                                             <td align="right" style="padding-right:10px;">
                                                                <?php
                                                                $itemdiscountper = html_escape($item['discount_per']);
                                                                echo (!empty($itemdiscountper)?$itemdiscountper:'');
                                                                ?>
                                                            </td>


                                                            <td align="right" style="padding-right:10px;width: 100px">
                                                                <?php
                                                                $amount += $item['total_price'];
                                                                $rate_total = html_escape($item['total_price']);
                                                                echo (($position == 0) ? "$rate_total" : "$rate_total ");
                                                                ?>
                                                            </td>
                                                        </tr>
                                                        <?php
                                                        $sl++;


                                                }
                                                ?>

                    </tbody>

                                            <tfoot>
                                                <tr>
                                            <td class="text-left" colspan="3" style="border: 0px"><b><?php echo display('sub_total') ?>:</b></td>
                                            <td align="right"  style="border: 0px;padding-right: 0px;"><b><?php echo html_escape(number_format($subTotal_quantity,0));?></b></td>
                                            <td style="border: 0px"></td>
                                            <td style="border: 0px"></td>
                                            <td align="right"  style="border: 0px;padding-right: 0px;"><b><?php echo html_escape((($position == 0) ? "$subTotal_ammount" : $subTotal_ammount)) ?></b></td>
                                        </tr>
                                            </tfoot>
                </table>
            </div>


                 <div class="row">


                                <div class="col-xs-4" style="display: inline-block;">

                                    <table class="table">
                                        <?php
                                        if ($invoice_all_data[0]['total_discount'] != 0) {
                                            ?>
                                            <tr>
                                                <th style="border-top: 0; border-bottom: 0;" align="right"><?php echo display('total_discount') ?> : </th>
                                                <th align="right" style="border-top: 0; border-bottom: 0;padding-right: 0px;"><?php echo html_escape((($position == 0) ? "$currency $total_discount" : "$total_discount $currency")) ?> </th>
                                            </tr>
                                            <?php
                                        }
                                        if ($invoice_all_data[0]['total_tax'] != 0) {
                                            ?>
                                            <tr>
                                                <th align="right" style="border-top: 0; border-bottom: 0;"><?php echo display('tax') ?> : </th>
                                                <th  align="right" style="border-top: 0; border-bottom: 0;padding-right: 10px;"><?php echo html_escape((($position == 0) ? "$currency $total_tax" : "$total_tax $currency")) ?> </th>
                                            </tr>
                                        <?php } ?>
                                         <?php if ($invoice_all_data[0]['shipping_cost'] != 0) {
                                            ?>
                                            <tr>
                                                <th align="right" style="border-top: 0; border-bottom: 0;"><?php echo display('shipping_cost') ?> : </th>
                                                <th align="right" style="border-top: 0; border-bottom: 0;padding-right: 10px;"><?php echo html_escape((($position == 0) ? "$currency $shipping_cost" : "$shipping_cost $currency")) ?> </th>
                                            </tr>
                                        <?php } ?>
                                        <tr>
                                            <th align="right" class="text-left grand_total"><?php echo display('previous'); ?> :</th>
                                            <th  align="right" style="padding-right: 10px;"><?php echo html_escape((($position == 0) ? "$currency $previous" : "$previous $currency")) ?></th>
                                        </tr>
                                        <tr>
                                            <th align="right"><?php echo display('grand_total') ?> :</th>
                                            <th align="right" style="padding-right: 10px;"><?php echo html_escape((($position == 0) ? "$currency $total_amount" : "$total_amount $currency")) ?></th>
                                        </tr>
                                        <tr>
                                            <th align="right" style="border-top: 0; border-bottom: 0;"><?php echo display('paid_ammount') ?> : </th>
                                            <th align="right" style="border-top: 0; border-bottom: 0;padding-right: 10px;"><?php echo html_escape((($position == 0) ? "$currency $paid_amount" : "$paid_amount $currency")) ?></th>
                                        </tr>
                                        <?php
                                        if ($invoice_all_data[0]['due_amount'] != 0) {
                                            ?>
                                            <tr>
                                                <th align="right"><?php echo display('due') ?> : </th>
                                                <th  align="right" style="padding-right: 10px;"><?php echo html_escape((($position == 0) ? "$currency $due_amount" : "$due_amount $currency")) ?></th>
                                            </tr>
                                            <?php
                                        }
                                        ?>
                                    </table>



                                </div>
                                 <div class="col-xs-8">

                                    <p></p>
                                    <p><?php echo html_escape($invoice_details);?></p>

                                </div>
                            </div>
                            <div class="row">

                                 <div class="first_section_left"    style="display: inline-block;width:30%;text-align:center;border-top:1px solid #e4e5e7;font-weight: bold;">
                                        <?php echo display('received_by') ?>
                                    </div>

                               <div class="first_section_center" style="display: inline-block;width:30%;"></div>

                                      <div class="first_section_right"    style="display: inline-block;width:30%;text-align:center;border-top:1px solid #e4e5e7;font-weight: bold;">
                                        <?php echo display('authorised_by') ?>
                                    </div>
                            </div>
    </div>

</div>

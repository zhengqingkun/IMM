<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017/11/29
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0093)http://vip2-gd.youshang.com/report/pu-summary-new.jsp?beginDate=2017-11-01&endDate=2017-11-21 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/print.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet"
          href="../../js/plugins/layer/laydate/need/laydate.css">
    <link type="text/css" rel="stylesheet"
          href="../../js/plugins/layer/laydate/skins/default/laydate.css"
          id="LayDateSkin">
    <link href="../../css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="../../js/vds.js"></script>
    <script src="../../js/jquery-1.10.2.min.js"></script>
    <script src="../../js/json3.min.js"></script>
    <script src="../../js/vue.js"></script>
    <script src="../../js/shopping.js"></script>
    <script src="../../js/common.js"></script>
    <script src="../../js/grid.js"></script>
    <script src="../../js/plugins.js"></script>
    <script src="../../js/jquery.dialog.js"></script>
    <script type="text/javascript">
        var _vds = _vds || [];
        window._vds = _vds;
        (function () {
            _vds.push(['setAccountId', '9bc3c61326fa7ba9']);
            (function () {
                var vds = document.createElement('script');
                vds.type = 'text/javascript';
                vds.async = true;
                vds.src = 'https://dn-growing.qbox.me/vds.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(vds, s);
            })();
        })();
    </script>

    <script type="text/javascript">
        var DOMAIN = document.domain;
        var WDURL = "";
        var SCHEME = "blue";
        try {
            var host = window.location.host;
            var domainDot = host.indexOf('.');
            var domain = host.substring(domainDot + 1, host.length);
            document.domain = domain;
        } catch (e) {
        }
        //ctrl+F5 增加版本号来清空iframe的缓存的
        $(document).keydown(function (event) {
            /* Act on the event */
            if (event.keyCode === 116 && event.ctrlKey) {
                var defaultPage = Public.getDefaultPage();
                var href = defaultPage.location.href.split('?')[0] + '?';
                var params = Public.urlParam();
                params['version'] = Date.parse((new Date()));
                for (i in params) {
                    if (i && typeof i != 'function') {
                        href += i + '=' + params[i] + '&';
                    }
                }
                defaultPage.location.href = href;
                event.preventDefault();
            }
        });
    </script>

    <link rel="stylesheet" href="../../css/report.css">
    <style>
        .ui-icon-ellipsis {
            right: 5px;
        }

        #grid tr {
            cursor: pointer;
        }

        .no-query {
            background: url("../../img/no_query.png") no-repeat scroll 100px 60px #fff;
            background-position: center;
            border: 1px solid #ddd;
            border-top: none;
            height: 402px;
            margin-right: 0;
        }

    </style>
</head>
<body style="">
<div class="wrapper">
    <!-- header -->
    <div class="mod-search cf" id="report-search">
        <div class="l" id="filter-menu">
            <ul class="ul-inline fix" id="filterItems">

                <li id="date" style="display: list-item;"><label>单据日期:</label>
                    <input id="hello" class="">
                    <span class="todate"> 至 </span>
                    <input id="end" class="">

                <li id="goods" style="display: list-item;"><label>商品:</label>
                    <span class="mod-choose-input" id="filter-goods">
                        <input type="text" class="ui-input" id="goodsAuto" autocomplete="off">
                        <span class="ui-icon-ellipsis"></span></span></li>
                <li id="supplier" style="display: list-item;"><label>供应商:</label>
                    <span class="mod-choose-input" id="filter-supplier">
                        <input type="text" class="ui-input" id="supplierAuto" autocomplete="off">
                        <span class="ui-icon-ellipsis"></span>
                    </span>
                </li>

                <li id="filter"><label>供应商类别</label><span id="catorage"></span></li>
                <li id="goodsfilter" style="display: list-item;">
                    <label>商品类别:</label>
                    <span class="ui-tree-wrap" style="width:145px">
                        <input type="text" class="input-txt" style="width:119px" id="filterCat" autocomplete="off" placeholder="类别" value="">
                        <span class="trigger"></span>
                    </span>
                </li>
                <div class="btns"><a class="ui-btn mrb ui-btn-search" id="filter-submit">查询</a></div>
            </ul>
        </div>
    </div>
    <!-- no data -->
    <div class="no-query"></div>
    <!-- grid begin -->
    <div class="ui-print" style="display: none;">
        <!-- 列配置 -->
        <div class="cf box-flex">
            <div class="flex">
                <span id="config" class="ui-config"><a
                        href="http://vip2-gd.youshang.com/report/pu-summary-new.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                        class="ui-icon-config-new"></a>列设置</span>
            </div>
            <div class="grid-title flex">采购汇总表</div>
            <div class="fr">
                <a href="http://vip2-gd.youshang.com/report/pu-summary-new.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-export btn-sm mrb fl" id="btn-export">导出</a>
                <a href="http://vip2-gd.youshang.com/report/pu-summary-new.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-print btn-sm fl" id="btn-print">打印</a>
            </div>
        </div>
        <div class="grid-wrap" id="grid-wrap" style="height: 486px;">
            <!-- <div class="grid-title">采购汇总表（）</div> -->
            <div class="grid-subtitle">日期: 2017-11-01 至 2017-11-27</div>
            <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr" style="width: 1170px;">
                <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
                <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
                <div class="ui-jqgrid-view" id="gview_grid" style="width: 1170px;">
                    <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                         style="display: none;"><a role="link"
                                                   class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                                   style="right: 0px;"><span
                            class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span>
                    </div>
                    <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1170px;">
                        <div class="ui-jqgrid-hbox">
                            <table class="ui-jqgrid-htable" style="width:1345px" role="grid" aria-labelledby="gbox_grid"
                                   cellspacing="0" cellpadding="0" border="0">
                                <thead>
                                <tr class="ui-jqgrid-labels" role="rowheader">
                                    <th id="grid_assistName" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_assistName" class="ui-jqgrid-sortable">商品类别<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_invNo" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_invNo" class="ui-jqgrid-sortable">商品编号<span class="s-ico"
                                                                                                       style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_invName" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 200px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_invName" class="ui-jqgrid-sortable">商品名称<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_spec" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_spec" class="ui-jqgrid-sortable">规格型号<span class="s-ico"
                                                                                                      style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_location" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_location" class="ui-jqgrid-sortable">仓库<span class="s-ico"
                                                                                                        style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_secondUnit" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_secondUnit" class="ui-jqgrid-sortable">副单位<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_secondQty" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_secondQty" class="ui-jqgrid-sortable">副单位数<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_unit" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_unit" class="ui-jqgrid-sortable">基本单位<span class="s-ico"
                                                                                                      style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_qty" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 80px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_qty" class="ui-jqgrid-sortable">基本数量<span class="s-ico"
                                                                                                     style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_unitPrice" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_unitPrice" class="ui-jqgrid-sortable">单价<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_amount" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_amount" class="ui-jqgrid-sortable">采购金额<span class="s-ico"
                                                                                                        style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>


                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-bdiv" style="height: 284.551px; width: 1170px;">
                        <div style="position:relative;">
                            <div></div>
                            <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                                   aria-multiselectable="false" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                                   style="width: 1170px;">
                                <tbody>

                                <tr role="row" id="1" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                    <td role="gridcell" style="text-align:center;width: 90px;" aria-describedby="grid_assistName">耗材</td>
                                    <td role="gridcell" style="text-align:center;width: 90px;" aria-describedby="grid_invNo">00100100001</td>
                                    <td role="gridcell" style="text-align:center;width: 233px;" aria-describedby="grid_invName">乌啦啦益生菌</td>
                                    <td role="gridcell" style="text-align:center;width: 66.5px;" aria-describedby="grid_spec">袋</td>
                                    <td role="gridcell" style="text-align:center;width: 90px;" aria-describedby="grid_location">成都仓库</td>
                                    <td role="gridcell" style="text-align:center;width: 90px;" aria-describedby="grid_secondUnit">1箱</td>
                                    <td role="gridcell" style="text-align:center;width: 90px;" aria-describedby="grid_secondQty">1.0000个1</td>
                                    <td role="gridcell" style="text-align:center;width: 113px;" aria-describedby="grid_unit">个1</td>
                                    <td role="gridcell" style="text-align:center;width: 89.5px;" aria-describedby="grid_qty">1.0000</td>
                                    <td role="gridcell" style="text-align:right;" aria-describedby="grid_unitPrice">&nbsp;</td>

                                </tr>
                                <tr role="row" id="2" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"> <td role="gridcell" style="text-align:center;" aria-describedby="grid_assistName">耗材</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_invNo">00100100001</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_invName">乌啦啦益生菌</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_spec">袋</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_location">成都仓库</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_secondUnit">1箱</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_secondQty">1.0000个1</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_unit">个1</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_qty">1.0000</td>
                                    <td role="gridcell" style="text-align:right;" aria-describedby="grid_unitPrice">&nbsp;</td></tr>
                                <tr role="row" id="3" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr"> <td role="gridcell" style="text-align:center;" aria-describedby="grid_assistName">耗材</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_invNo">00100100001</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_invName">乌啦啦益生菌</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_spec">袋</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_location">成都仓库</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_secondUnit">1箱</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_secondQty">1.0000个1</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_unit">个1</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_qty">1.0000</td>
                                    <td role="gridcell" style="text-align:right;" aria-describedby="grid_unitPrice">&nbsp;</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-sdiv" style="width: 1170px;">
                        <div class="ui-jqgrid-hbox">
                            <table role="grid" style="width:1345px" class="ui-jqgrid-ftable" cellspacing="0"
                                   cellpadding="0" border="0">
                                <tbody>
                                <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                    <td role="gridcell"
                                        style="text-align: center; width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_assistName">合计:
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_invNo">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 200px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_invName">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 60px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_spec">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_location">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_secondUnit">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 80px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_secondQty">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_unit">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 80px;"
                                        aria-describedby="grid_qty">4
                                    </td>
                                    <td role="gridcell" style="text-align:right;width: 120px;"
                                        aria-describedby="grid_unitPrice">0
                                    </td>
                                    <td role="gridcell" style="text-align:right;width: 120px;"
                                        aria-describedby="grid_amount">0
                                    </td>
                                    <td role="gridcell" style="text-align:right;width: 100px;"
                                        aria-describedby="grid_tax">0
                                    </td>
                                    <td role="gridcell" style="text-align:right;width: 100px;"
                                        aria-describedby="grid_taxAmount">0
                                    </td>
                                    <td role="gridcell" style="display:none;width: 150px;"
                                        aria-describedby="grid_locationNo">&nbsp;
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
            </div>
        </div>
    </div>
    <!-- grid end -->
</div>

<div id="COMBO_WRAP">
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="display: none; position: absolute; top: 0px; z-index: 1000;">
        <div class="droplist" style="position: relative; overflow: auto;"></div>
    </div>
    <div class="ui-droplist-wrap" style="position: absolute; top: 0px; z-index: 1000; width: 175px; display: none;">
        <div class="droplist" style="position: relative; overflow: auto; height: 26px;">
            <div class="list-item" data-value="129609203891259700">CK001 默认仓库</div>
        </div>
    </div>
</div>
<div class="pika-single is-hidden is-bound" style=""></div>
<div class="pika-single is-hidden is-bound" style=""></div>
<ul id="tree1164" class="ztree ztreeCombo showRoot" style="top: 143px; left: 524px; width: 250px;">
    <li id="tree1164_1" class="level0" tabindex="0" hidefocus="true" treenode=""><span id="tree1164_1_switch" title=""
                                                                                       class="button level0 switch root_docu"
                                                                                       treenode_switch=""></span><a
            id="tree1164_1_a" class="level0" treenode_a="" onclick="" target="_blank" style=""><span id="tree1164_1_ico"
                                                                                                     title=""
                                                                                                     treenode_ico=""
                                                                                                     class="button ico_docu"
                                                                                                     style=""></span><span
            id="tree1164_1_span">全部</span></a></li>
</ul>
<div style="left: 0px; top: 0px; visibility: hidden; position: absolute;" class="">
    <table class="ui_border">
        <tbody>
        <tr>
            <td class="ui_lt"></td>
            <td class="ui_t"></td>
            <td class="ui_rt"></td>
        </tr>
        <tr>
            <td class="ui_l"></td>
            <td class="ui_c">
                <div class="ui_inner">
                    <table class="ui_dialog">
                        <tbody>
                        <tr>
                            <td colspan="2">
                                <div class="ui_title_bar">
                                    <div class="ui_title" unselectable="on" style="cursor: move;"></div>
                                    <div class="ui_title_buttons"><a class="ui_min" href="javascript:void(0);"
                                                                     title="最小化" style="display: none;"><b
                                            class="ui_min_b"></b></a><a class="ui_max" href="javascript:void(0);"
                                                                        title="最大化" style="display: none;"><b
                                            class="ui_max_b"></b></a><a class="ui_res" href="javascript:void(0);"
                                                                        title="还原"><b class="ui_res_b"></b><b
                                            class="ui_res_t"></b></a><a class="ui_close" href="javascript:void(0);"
                                                                        title="关闭(esc键)" style="display: inline-block;">×</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="ui_icon" style="display: none;"></td>
                            <td class="ui_main" style="width: auto; height: auto;">
                                <div class="ui_content" style="padding: 10px;"></div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="ui_buttons" style="display: none;"></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </td>
            <td class="ui_r"></td>
        </tr>
        <tr>
            <td class="ui_lb"></td>
            <td class="ui_b"></td>
            <td class="ui_rb" style="cursor: auto;"></td>
        </tr>
        </tbody>
    </table>
</div>
<script src="../../js/jquery.min.js?v=2.1.4"></script>
<script src="../../js/bootstrap.min.js?v=3.3.6"></script>
<script src="../../js/content.min.js?v=1.0.0"></script>
<script src="../../js/plugins/layer/laydate/laydate.js"></script>
<script>
    laydate({elem: "#hello", event: "focus"});
    var start = {
        elem: "#start",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas;
            end.start = datas
        }
    };
    var end = {
        elem: "#end",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas
        }
    };
    laydate(start);
    laydate(end);
</script>
<script>
    laydate({elem: "#end", event: "focus"});
    var start = {
        elem: "#start",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            end.min = datas;
            end.start = datas
        }
    };
    var end = {
        elem: "#end",
        format: "YYYY/MM/DD hh:mm:ss",
        min: laydate.now(),
        max: "2099-06-16 23:59:59",
        istime: true,
        istoday: false,
        choose: function (datas) {
            start.max = datas
        }
    };
    laydate(start);
    laydate(end);
</script>
</body>
</html>
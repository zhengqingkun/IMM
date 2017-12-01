<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017/11/28
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0092)http://vip2-gd.youshang.com/report/pu-pay-detail.jsp?beginDate=2017-11-01&endDate=2017-11-21 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/print.css" rel="stylesheet" type="text/css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/js/plugins/layer/laydate/need/laydate.css">
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath }/js/plugins/layer/laydate/skins/default/laydate.css"
          id="LayDateSkin">
    <link href="${pageContext.request.contextPath }/css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="${pageContext.request.contextPath }/js/vds.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/json3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script src="${pageContext.request.contextPath }/js/shopping.js"></script>
    <script src="${pageContext.request.contextPath }/js/common.js"></script>
    <script src="${pageContext.request.contextPath }/js/grid.js"></script>
    <script src="${pageContext.request.contextPath }/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath }/js/jquery.dialog.js"></script>
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

    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/report.css">
    <style type="text/css">
        .filter-menu .mod-choose-input {
            position: relative;
            *zoom: 1;
        }

        .filter-menu .mod-choose-input .ui-input {
            padding-right: 25px;
            width: 226px;
            font-family: "宋体";
        }

        .filter-menu .ui-datepicker-input {
            width: 105px;
            font-family: "宋体";
        }

        .ui-icon-ellipsis {
            right: 3px;
        }

        .ul-inline li {
            position: relative;
        }

        .no-query {
            background: url("${pageContext.request.contextPath }/img/no_query.png") no-repeat scroll 100px 60px #fff;
            background-position: center;
            border: 1px solid #ddd;
            border-top: none;
            height: 402px;
            margin-right: 0;
        }

        #chk-wrap {
            line-height: 30px;
        }

        .frozen-sdiv {
            display: none;
        }

        #grid tr {
            cursor: pointer;
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
                    <input id="end" class=""></li>
                <li id="billsNo"><label>单据编号:</label><input type="text" class="ui-input ui-input-ph" id="billsNoAuto">
                </li>
                <li id="sale-rank-filter"><span id="sale-rank-catorage"></span></li>
                <li id="filter" style="display: list-item;"><label>供应商类别</label><span class="ui-tree-wrap"
                                                                                      style="width:122px"><input
                        type="text" class="input-txt" style="width:96px" id="catorage" autocomplete="off"
                        placeholder="类别" value=""><span class="trigger"></span></span></li>
                <li id="customer"><label>客户:</label><span class="mod-choose-input" id="filter-customer"><input
                        type="text" class="ui-input" id="customerAuto"><span class="ui-icon-ellipsis"></span></span>
                </li>
                <li id="supplier" style="display: list-item;"><label>供应商:</label><span class="mod-choose-input"
                                                                                       id="filter-supplier"><input
                        type="text" class="ui-input" id="supplierAuto" autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="goods"><label>商品:</label><span class="mod-choose-input" id="filter-goods"><input type="text"
                                                                                                         class="ui-input"
                                                                                                         id="goodsAuto"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="sales"><label>销售人员:</label><span class="mod-choose-input" id="filter-saler"><input type="text"
                                                                                                           class="ui-input"
                                                                                                           id="salerAuto"
                                                                                                           autocomplete="off"><span
                        class="ui-icon-ellipsis"></span></span></li>
                <li id="remarks"><label>备注(分录):</label><input type="text" value="请输入备注查询" class="ui-input ui-input-ph"
                                                              name="remarkCon" id="remarkCon"></li>
                <li id="billNum" style="display: list-item;">
                    <label>采购单号</label><input type="text" value="请输入单号查询" style="width:115px;"
                                              class="ui-input ui-input-ph" name="matchCon" id="matchCon">
                </li>

                <div class="btns"><a class="ui-btn mrb ui-btn-search" id="filter-submit">查询</a></div>
            </ul>
            <a href="http://vip2-gd.youshang.com/report/pu-pay-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
               id="conditions-trigger" class="ui-btn conditions-trigger" tabindex="-1" style="display: none;">&nbsp;更多条件<b></b></a>
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
                        href="http://vip2-gd.youshang.com/report/pu-pay-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                        class="ui-icon-config-new"></a>列设置</span>
            </div>
            <div class="grid-title flex">采购付款一览表</div>
            <div class="fr">
                <a href="http://vip2-gd.youshang.com/report/pu-pay-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-export btn-sm mrb fl" id="btn-export">导出</a>
                <a href="http://vip2-gd.youshang.com/report/pu-pay-detail.jsp?beginDate=2017-11-01&amp;endDate=2017-11-21#"
                   class="ui-btn ui-btn-print btn-sm fl" id="btn-print">打印</a>
            </div>
        </div>
        <div class="grid-wrap" id="grid-wrap" style="height: 486px;">
            <!-- <div class="grid-title">采购付款一览表</div> -->
            <div class="grid-subtitle">日期: 2017-11-01 至 2017-11-27</div>
            <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
                 style="width: 1170px;">
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
                            <table class="ui-jqgrid-htable" style="width:1440px" role="grid" aria-labelledby="gbox_grid"
                                   cellspacing="0" cellpadding="0" border="0">
                                <thead>
                                <tr class="ui-jqgrid-labels" role="rowheader">
                                    <th id="grid_FCUSTTYPE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FCUSTTYPE" class="ui-jqgrid-sortable">供应商类别<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FCUSTNAME" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FCUSTNAME" class="ui-jqgrid-sortable">供应商<span class="s-ico"
                                                                                                          style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FTRANSTYPE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr"
                                        style="width: 150px; display: none;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FTRANSTYPE" class="ui-jqgrid-sortable">业务类别Id<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FTRANSTYPENAME" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 110px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FTRANSTYPENAME" class="ui-jqgrid-sortable">业务类别<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FDATE" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 110px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FDATE" class="ui-jqgrid-sortable">单据日期<span class="s-ico"
                                                                                                       style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FBILLNO" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 120px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FBILLNO" class="ui-jqgrid-sortable">单据编号<span class="s-ico"
                                                                                                         style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FTOTALAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FTOTALAMOUNT" class="ui-jqgrid-sortable">采购金额<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FDISAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FDISAMOUNT" class="ui-jqgrid-sortable">优惠金额<span
                                                class="s-ico" style="display:none"><span sort="asc"
                                                                                         class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FAMOUNT" class="ui-jqgrid-sortable">优惠后金额<span class="s-ico"
                                                                                                          style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_FRPAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_FRPAMOUNT" class="ui-jqgrid-sortable">本次付款<span class="s-ico"
                                                                                                           style="display:none"><span
                                                sort="asc"
                                                class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                                sort="desc"
                                                class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                        </div>
                                    </th>
                                    <th id="grid_YSAMOUNT" role="columnheader"
                                        class="ui-state-default ui-th-column ui-th-ltr" style="width: 100px;"><span
                                            class="ui-jqgrid-resize ui-jqgrid-resize-ltr" style="cursor: col-resize;">&nbsp;</span>
                                        <div id="jqgh_grid_YSAMOUNT" class="ui-jqgrid-sortable">应付款余额<span class="s-ico"
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
                                <tr role="row" id="1"  class="ui-widget-content jqgrow ui-row-ltr">
                                    <td role="gridcell" style="text-align:center;width:177.5px;" aria-describedby="grid_FCUSTTYPE">进口果</td>
                                    <td role="gridcell" style="text-align:center;width:177.5px;" aria-describedby="grid_FCUSTNAME">00004 安阳自行车配件厂697</td>
                                    <td role="gridcell" style="text-align:center;width:129.5px;" aria-describedby="grid_FTRANSTYPENAME">普通采购</td>
                                    <td role="gridcell" style="text-align:center;width:129px;" aria-describedby="grid_FDATE">2017-11-02</td>
                                    <td role="gridcell" style="text-align:center;width:139.5px;" aria-describedby="grid_FBILLNO">CG20171102001</td>
                                    <td role="gridcell" style="text-align:center;width:116px;" aria-describedby="grid_FTOTALAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;width: 116px" aria-describedby="grid_FDISAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FAMOUNT">&nbsp;</td>

                                </tr>
                                <tr role="row" id="2"  class="ui-widget-content jqgrow ui-row-ltr">
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FCUSTTYPE">进口果</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FCUSTNAME">00004 安阳自行车配件厂697</td>
                                    <td role="gridcell" style="display:none;" aria-describedby="grid_FTRANSTYPE">150501</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FTRANSTYPENAME">普通采购</td><td role="gridcell" style="text-align:center;" aria-describedby="grid_FDATE">2017-11-02</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FBILLNO">CG20171102001</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FTOTALAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FDISAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FAMOUNT">&nbsp;</td>

                                </tr>
                                <tr role="row" id="3" tabindex="-1" class="ui-widget-content jqgrow ui-row-ltr">
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FCUSTTYPE">进口果</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FCUSTNAME">00004 安阳自行车配件厂697</td>
                                    <td role="gridcell" style="display:none;" aria-describedby="grid_FTRANSTYPE">150501</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FTRANSTYPENAME">普通采购</td><td role="gridcell" style="text-align:center;" aria-describedby="grid_FDATE">2017-11-02</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FBILLNO">CG20171102001</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FTOTALAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FDISAMOUNT">&nbsp;</td>
                                    <td role="gridcell" style="text-align:center;" aria-describedby="grid_FAMOUNT">&nbsp;</td>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="ui-jqgrid-sdiv" style="width: 1170px;">
                        <div class="ui-jqgrid-hbox">
                            <table role="grid" style="width:1170px" class="ui-jqgrid-ftable" cellspacing="0"
                                   cellpadding="0" border="0">
                                <tbody>
                                <tr role="row" class="ui-widget-content footrow footrow-ltr">
                                    <td role="gridcell"
                                        style="text-align: center; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FCUSTTYPE">合计:
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FCUSTNAME">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="display: none; width: 150px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FTRANSTYPE">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 110px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FTRANSTYPENAME">&nbsp;
                                    </td>
                                    <td role="gridcell"
                                        style="text-align: center; width: 110px; border-right-color: rgb(255, 255, 255);"
                                        aria-describedby="grid_FDATE">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 120px;"
                                        aria-describedby="grid_FBILLNO">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FTOTALAMOUNT">8,002.26
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FDISAMOUNT">338.71
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FAMOUNT">7,663.55
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_FRPAMOUNT">7,663.55
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_YSAMOUNT">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 100px;"
                                        aria-describedby="grid_BACKRATE">100.00%
                                    </td>
                                    <td role="gridcell" style="text-align:center;width: 200px;"
                                        aria-describedby="grid_FDESC">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;display:none;width: 150px;"
                                        aria-describedby="grid_FBILLID">&nbsp;
                                    </td>
                                    <td role="gridcell" style="text-align:center;display:none;width: 150px;"
                                        aria-describedby="grid_FBILLTYPE">&nbsp;
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
</div>
<div class="pika-single is-hidden is-bound" style=""></div>
<div class="pika-single is-hidden is-bound" style=""></div>
<ul id="tree5097" class="ztree ztreeCombo showRoot" style="max-height: 200px; top: 143px; left: 524px; width: 250px;">
    <li id="tree5097_1" class="level0" tabindex="0" hidefocus="true" treenode="">
        <span id="tree5097_1_switch" title="" class="button level0 switch root_docu" treenode_switch=""></span>
        <a id="tree5097_1_a" class="level0" treenode_a="" onclick="" target="_blank" style="">
            <span id="tree5097_1_ico" title="" treenode_ico="" class="button ico_docu" style=""></span><span
                id="tree5097_1_span"></span></a></li>
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
                                    <div class="ui_title_buttons">
                                        <a class="ui_min" href="javascript:void(0);" title="最小化" style="display: none;">
                                            <b class="ui_min_b"></b>
                                        </a>
                                        <a class="ui_max" href="javascript:void(0);" title="最大化" style="display: none;">
                                            <b class="ui_max_b"></b>
                                        </a><a class="ui_res" href="javascript:void(0);" title="还原"><b class="ui_res_b"></b>
                                        <b class="ui_res_t"></b></a>
                                        <a class="ui_close" href="javascript:void(0);" title="关闭(esc键)" style="display: inline-block;">×</a>
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
<script src="${pageContext.request.contextPath }/js/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath }/js/content.min.js?v=1.0.0"></script>
<script src="${pageContext.request.contextPath }/js/plugins/layer/laydate/laydate.js"></script>
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
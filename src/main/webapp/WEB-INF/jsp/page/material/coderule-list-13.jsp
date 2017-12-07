<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2017-12-06
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0054)http://vip2-gd.youshang.com/settings/coderule-list.jsp -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=1280, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="renderer" content="webkit|ie-stand|ie-comp">
    <title>精斗云云进销存</title>

    <link rel="icon" href="http://vip2-gd.youshang.com/css/blue/img/favicon.png" type="image/x-icon">
    <link href="../../css/common.css" rel="stylesheet" type="text/css">
    <link href="../../css/print.css" rel="stylesheet" type="text/css">

    <link href="../../css/ui.min.css" rel="stylesheet">
    <script type="text/javascript" async="" src="../../js/vds.js"></script>
    <script src="../../js/jquery-1.10.2.min.js"></script>
    <script src="../../js/json3.min.js"></script>
    <script src="../../js/vue.js"></script>
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

    <style>
        .matchCon {
            width: 280px;
        }

        .chk-list {
            line-height: 28px;
        }
    </style>
</head>
<body style="">
<div class="wrapper btc">
    <div class="ui-config-box">
          <span id="config" class="ui-config">
            <a href="http://vip2-gd.youshang.com/settings/coderule-list.jsp#" class="ui-icon-config-new"></a>
            列设置
            </span>
    </div>

    <div class="bill-ser-botm cf">
        <div class="fr ml10">
            <a href="http://vip2-gd.youshang.com/settings/coderule-list.jsp#" class="ui-btn-bill ui-btn-add mrb"
               id="btn-add">新增</a>
            <a href="http://vip2-gd.youshang.com/settings/coderule-list.jsp#" class="ui-btn-bill"
               id="btn-batchDel">删除</a>
        </div>
    </div>
    <div class="grid-wrap">
        <div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid" dir="ltr"
             style="width: 1371px;">
            <div class="ui-widget-overlay jqgrid-overlay" id="lui_grid"></div>
            <div class="loading ui-state-default ui-state-active" id="load_grid" style="display: none;">读取中...</div>
            <div class="ui-jqgrid-view" id="gview_grid" style="width: 1371px;">
                <div class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
                     style="display: none;"><a role="link" class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
                                               style="right: 0px;"><span
                        class="ui-icon ui-icon-circle-triangle-n"></span></a><span class="ui-jqgrid-title"></span></div>
                <div class="ui-state-default ui-jqgrid-hdiv ui-corner-top" style="width: 1371px;">
                    <div class="ui-jqgrid-hbox">
                        <table class="ui-jqgrid-htable" style="width:1080px" role="grid" aria-labelledby="gbox_grid"
                               cellspacing="0" cellpadding="0" border="0">
                            <thead>
                            <tr class="ui-jqgrid-labels" role="rowheader">
                                <th id="grid_rn" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 25px;">
                                    <div id="jqgh_grid_rn"><span class="s-ico" style="display:none"><span sort="asc"
                                                                                                          class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_cb" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 20px;">
                                    <div id="jqgh_grid_cb"><input role="checkbox" id="cb_grid" class="cbox"
                                                                  type="checkbox"><span class="s-ico"
                                                                                        style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_operate" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 60px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_operate" class="ui-jqgrid-sortable">操作<span class="s-ico"
                                                                                                   style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_id" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_id" class="ui-jqgrid-sortable">id<span class="s-ico"
                                                                                              style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_typeNo" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_typeNo" class="ui-jqgrid-sortable">单据类型<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_typeName" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_typeName" class="ui-jqgrid-sortable">单据类型<span class="s-ico"
                                                                                                      style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_name" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                                style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_name" class="ui-jqgrid-sortable">规则名称<span class="s-ico"
                                                                                                  style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_numMode" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_numMode" class="ui-jqgrid-sortable">年月日<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_numberDemo" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 250px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_numberDemo" class="ui-jqgrid-sortable">编号规则<span class="s-ico"
                                                                                                        style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_digits" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 80px;"><span class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                                               style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_digits" class="ui-jqgrid-sortable">编号位数<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_startNo" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_startNo" class="ui-jqgrid-sortable">起始编号<span class="s-ico"
                                                                                                     style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_prefix" role="columnheader" class="ui-state-default ui-th-column ui-th-ltr"
                                    style="width: 150px; display: none;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_prefix" class="ui-jqgrid-sortable">编码前缀<span class="s-ico"
                                                                                                    style="display:none"><span
                                            sort="asc"
                                            class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
                                            sort="desc"
                                            class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
                                    </div>
                                </th>
                                <th id="grid_defaults" role="columnheader"
                                    class="ui-state-default ui-th-column ui-th-ltr" style="width: 150px;"><span
                                        class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
                                        style="cursor: col-resize;">&nbsp;</span>
                                    <div id="jqgh_grid_defaults" class="ui-jqgrid-sortable">默认状态<span class="s-ico"
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
                <div class="ui-jqgrid-bdiv" style="height: 522px; width: 1371px;">
                    <div style="position:relative;">
                        <div></div>
                        <table id="grid" tabindex="0" cellspacing="0" cellpadding="0" border="0" role="grid"
                               aria-multiselectable="true" aria-labelledby="gbox_grid" class="ui-jqgrid-btable"
                               style="width: 1080px;">
                            <tbody>
                            <tr class="jqgfirstrow" role="row" style="height:auto">
                                <td role="gridcell" style="height:0px;width:25px;"></td>
                                <td role="gridcell" style="height:0px;width:20px;"></td>
                                <td role="gridcell" style="height:0px;width:60px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:150px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:250px;"></td>
                                <td role="gridcell" style="height:0px;width:80px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;"></td>
                                <td role="gridcell" style="height:0px;width:150px;display:none;"></td>
                                <td role="gridcell" style="height:0px;width:150px;"></td>
                            </tr>
                            <tr role="row" id="129609203891259685" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr" aria-selected="false">
                                <td role="gridcell" class="ui-state-default jqgrid-rownum"
                                    style="text-align:center;width: 25px;" title="1" aria-describedby="grid_rn">1
                                </td>
                                <td role="gridcell" style="text-align:center;width: 20px;" aria-describedby="grid_cb">
                                    <input role="checkbox" type="checkbox" id="jqg_grid_129609203891259685" class="cbox"
                                           name="jqg_grid_129609203891259685"></td>
                                <td role="gridcell" style="" title="" aria-describedby="grid_operate">
                                    <div class="operating" data-id="129609203891259685"><span
                                            class="ui-icon ui-icon-pencil" title="修改"></span><span
                                            class="ui-icon ui-icon-trash" title="删除"></span></div>
                                </td>
                                <td role="gridcell" style="display:none;" title="129609203891259685"
                                    aria-describedby="grid_id">129609203891259685
                                </td>
                                <td role="gridcell" style="display:none;" title="PUR" aria-describedby="grid_typeNo">
                                    PUR
                                </td>
                                <td role="gridcell" style="text-align:center;" title="购货单"
                                    aria-describedby="grid_typeName">购货单
                                </td>
                                <td role="gridcell" style="text-align:center;" title="GHD" aria-describedby="grid_name">
                                    GHD
                                </td>
                                <td role="gridcell" style="display:none;" title="4" aria-describedby="grid_numMode">4
                                </td>
                                <td role="gridcell" style="text-align:center;" title="GH20171121001"
                                    aria-describedby="grid_numberDemo">GH20171121001
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis" title="3"
                                    aria-describedby="grid_digits">3
                                </td>
                                <td role="gridcell" style="text-align:center;" title="001"
                                    aria-describedby="grid_startNo">001
                                </td>
                                <td role="gridcell" style="display:none;" title="GH" aria-describedby="grid_prefix">GH
                                </td>
                                <td role="gridcell" style="text-align:center;" title="是"
                                    aria-describedby="grid_defaults">是
                                </td>
                            </tr>
                            <tr role="row" id="129609203891259686" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr ui-priority-secondary" aria-selected="false">
                                <td role="gridcell" class="ui-state-default jqgrid-rownum" style="text-align:center;"
                                    title="2" aria-describedby="grid_rn">2
                                </td>
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_129609203891259686" class="cbox"
                                        name="jqg_grid_129609203891259686"></td>
                                <td role="gridcell" style="" title="" aria-describedby="grid_operate">
                                    <div class="operating" data-id="129609203891259686"><span
                                            class="ui-icon ui-icon-pencil" title="修改"></span><span
                                            class="ui-icon ui-icon-trash" title="删除"></span></div>
                                </td>
                                <td role="gridcell" style="display:none;" title="129609203891259686"
                                    aria-describedby="grid_id">129609203891259686
                                </td>
                                <td role="gridcell" style="display:none;" title="PO" aria-describedby="grid_typeNo">PO
                                </td>
                                <td role="gridcell" style="text-align:center;" title="购货订单"
                                    aria-describedby="grid_typeName">购货订单
                                </td>
                                <td role="gridcell" style="text-align:center;" title="GHDD"
                                    aria-describedby="grid_name">GHDD
                                </td>
                                <td role="gridcell" style="display:none;" title="4" aria-describedby="grid_numMode">4
                                </td>
                                <td role="gridcell" style="text-align:center;" title="GHDD20171121001"
                                    aria-describedby="grid_numberDemo">GHDD20171121001
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis" title="3"
                                    aria-describedby="grid_digits">3
                                </td>
                                <td role="gridcell" style="text-align:center;" title="001"
                                    aria-describedby="grid_startNo">001
                                </td>
                                <td role="gridcell" style="display:none;" title="GHDD" aria-describedby="grid_prefix">
                                    GHDD
                                </td>
                                <td role="gridcell" style="text-align:center;" title="是"
                                    aria-describedby="grid_defaults">是
                                </td>
                            </tr>
                            <tr role="row" id="129609203891259687" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr" aria-selected="false">
                                <td role="gridcell" class="ui-state-default jqgrid-rownum" style="text-align:center;"
                                    title="3" aria-describedby="grid_rn">3
                                </td>
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_129609203891259687" class="cbox"
                                        name="jqg_grid_129609203891259687"></td>
                                <td role="gridcell" style="" title="" aria-describedby="grid_operate">
                                    <div class="operating" data-id="129609203891259687"><span
                                            class="ui-icon ui-icon-pencil" title="修改"></span><span
                                            class="ui-icon ui-icon-trash" title="删除"></span></div>
                                </td>
                                <td role="gridcell" style="display:none;" title="129609203891259687"
                                    aria-describedby="grid_id">129609203891259687
                                </td>
                                <td role="gridcell" style="display:none;" title="PURT" aria-describedby="grid_typeNo">
                                    PURT
                                </td>
                                <td role="gridcell" style="text-align:center;" title="购货退货单"
                                    aria-describedby="grid_typeName">购货退货单
                                </td>
                                <td role="gridcell" style="text-align:center;" title="GHTD"
                                    aria-describedby="grid_name">GHTD
                                </td>
                                <td role="gridcell" style="display:none;" title="4" aria-describedby="grid_numMode">4
                                </td>
                                <td role="gridcell" style="text-align:center;" title="GHT20171121001"
                                    aria-describedby="grid_numberDemo">GHT20171121001
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis" title="3"
                                    aria-describedby="grid_digits">3
                                </td>
                                <td role="gridcell" style="text-align:center;" title="001"
                                    aria-describedby="grid_startNo">001
                                </td>
                                <td role="gridcell" style="display:none;" title="GHT" aria-describedby="grid_prefix">
                                    GHT
                                </td>
                                <td role="gridcell" style="text-align:center;" title="是"
                                    aria-describedby="grid_defaults">是
                                </td>
                            </tr>
                            <tr role="row" id="129609203891259688" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr ui-priority-secondary" aria-selected="false">
                                <td role="gridcell" class="ui-state-default jqgrid-rownum" style="text-align:center;"
                                    title="4" aria-describedby="grid_rn">4
                                </td>
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_129609203891259688" class="cbox"
                                        name="jqg_grid_129609203891259688"></td>
                                <td role="gridcell" style="" title="" aria-describedby="grid_operate">
                                    <div class="operating" data-id="129609203891259688"><span
                                            class="ui-icon ui-icon-pencil" title="修改"></span><span
                                            class="ui-icon ui-icon-trash" title="删除"></span></div>
                                </td>
                                <td role="gridcell" style="display:none;" title="129609203891259688"
                                    aria-describedby="grid_id">129609203891259688
                                </td>
                                <td role="gridcell" style="display:none;" title="SALE" aria-describedby="grid_typeNo">
                                    SALE
                                </td>
                                <td role="gridcell" style="text-align:center;" title="销货单"
                                    aria-describedby="grid_typeName">销货单
                                </td>
                                <td role="gridcell" style="text-align:center;" title="XHD" aria-describedby="grid_name">
                                    XHD
                                </td>
                                <td role="gridcell" style="display:none;" title="4" aria-describedby="grid_numMode">4
                                </td>
                                <td role="gridcell" style="text-align:center;" title="XH20171121001"
                                    aria-describedby="grid_numberDemo">XH20171121001
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis" title="3"
                                    aria-describedby="grid_digits">3
                                </td>
                                <td role="gridcell" style="text-align:center;" title="001"
                                    aria-describedby="grid_startNo">001
                                </td>
                                <td role="gridcell" style="display:none;" title="XH" aria-describedby="grid_prefix">XH
                                </td>
                                <td role="gridcell" style="text-align:center;" title="是"
                                    aria-describedby="grid_defaults">是
                                </td>
                            </tr>
                            <tr role="row" id="129609203891259689" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr">
                                <td role="gridcell" class="ui-state-default jqgrid-rownum" style="text-align:center;"
                                    title="5" aria-describedby="grid_rn">5
                                </td>
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_129609203891259689" class="cbox"
                                        name="jqg_grid_129609203891259689"></td>
                                <td role="gridcell" style="" title="" aria-describedby="grid_operate">
                                    <div class="operating" data-id="129609203891259689"><span
                                            class="ui-icon ui-icon-pencil" title="修改"></span><span
                                            class="ui-icon ui-icon-trash" title="删除"></span></div>
                                </td>
                                <td role="gridcell" style="display:none;" title="129609203891259689"
                                    aria-describedby="grid_id">129609203891259689
                                </td>
                                <td role="gridcell" style="display:none;" title="SO" aria-describedby="grid_typeNo">SO
                                </td>
                                <td role="gridcell" style="text-align:center;" title="销货订单"
                                    aria-describedby="grid_typeName">销货订单
                                </td>
                                <td role="gridcell" style="text-align:center;" title="XHDD"
                                    aria-describedby="grid_name">XHDD
                                </td>
                                <td role="gridcell" style="display:none;" title="4" aria-describedby="grid_numMode">4
                                </td>
                                <td role="gridcell" style="text-align:center;" title="XHDD20171121001"
                                    aria-describedby="grid_numberDemo">XHDD20171121001
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis" title="3"
                                    aria-describedby="grid_digits">3
                                </td>
                                <td role="gridcell" style="text-align:center;" title="001"
                                    aria-describedby="grid_startNo">001
                                </td>
                                <td role="gridcell" style="display:none;" title="XHDD" aria-describedby="grid_prefix">
                                    XHDD
                                </td>
                                <td role="gridcell" style="text-align:center;" title="是"
                                    aria-describedby="grid_defaults">是
                                </td>
                            </tr>
                            <tr role="row" id="129609203891259690" tabindex="-1"
                                class="ui-widget-content jqgrow ui-row-ltr ui-priority-secondary" aria-selected="false">
                                <td role="gridcell" class="ui-state-default jqgrid-rownum" style="text-align:center;"
                                    title="6" aria-describedby="grid_rn">6
                                </td>
                                <td role="gridcell" style="text-align:center;" aria-describedby="grid_cb"><input
                                        role="checkbox" type="checkbox" id="jqg_grid_129609203891259690" class="cbox"
                                        name="jqg_grid_129609203891259690"></td>
                                <td role="gridcell" style="" title="" aria-describedby="grid_operate">
                                    <div class="operating" data-id="129609203891259690"><span
                                            class="ui-icon ui-icon-pencil" title="修改"></span><span
                                            class="ui-icon ui-icon-trash" title="删除"></span></div>
                                </td>
                                <td role="gridcell" style="display:none;" title="129609203891259690"
                                    aria-describedby="grid_id">129609203891259690
                                </td>
                                <td role="gridcell" style="display:none;" title="SALET" aria-describedby="grid_typeNo">
                                    SALET
                                </td>
                                <td role="gridcell" style="text-align:center;" title="销货退货单"
                                    aria-describedby="grid_typeName">销货退货单
                                </td>
                                <td role="gridcell" style="text-align:center;" title="XHTD"
                                    aria-describedby="grid_name">XHTD
                                </td>
                                <td role="gridcell" style="display:none;" title="4" aria-describedby="grid_numMode">4
                                </td>
                                <td role="gridcell" style="text-align:center;" title="XHT20171121001"
                                    aria-describedby="grid_numberDemo">XHT20171121001
                                </td>
                                <td role="gridcell" style="text-align:center;" class="ui-ellipsis" title="3"
                                    aria-describedby="grid_digits">3
                                </td>
                                <td role="gridcell" style="text-align:center;" title="001"
                                    aria-describedby="grid_startNo">001
                                </td>
                                <td role="gridcell" style="display:none;" title="XHT" aria-describedby="grid_prefix">
                                    XHT
                                </td>
                                <td role="gridcell" style="text-align:center;" title="是"
                                    aria-describedby="grid_defaults">是
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="ui-jqgrid-resize-mark" id="rs_mgrid">&nbsp;</div>
            <div id="page" class="ui-state-default ui-jqgrid-pager ui-corner-bottom" dir="ltr" style="width: 1371px;">
                <div id="pg_page" class="ui-pager-control" role="group">
                    <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table"
                           style="width:100%;table-layout:fixed;height:100%;" role="row">
                        <tbody>
                        <tr>
                            <td id="page_left" align="left"></td>
                            <td id="page_center" align="center" style="white-space: pre; width: 282px;">
                                <table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;"
                                       class="ui-pg-table">
                                    <tbody>
                                    <tr>
                                        <td id="first_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-first"></span></td>
                                        <td id="prev_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-prev"></span></td>
                                        <td class="ui-pg-button ui-state-disabled" style="width:4px;"><span
                                                class="ui-separator"></span></td>
                                        <td dir="ltr"><input class="ui-pg-input" type="text" size="2" maxlength="7"
                                                             value="0" role="textbox"> 共 <span id="sp_1_page">1</span> 页
                                        </td>
                                        <td class="ui-pg-button ui-state-disabled" style="width:4px;"><span
                                                class="ui-separator"></span></td>
                                        <td id="next_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-next"></span></td>
                                        <td id="last_page" class="ui-pg-button ui-corner-all ui-state-disabled"><span
                                                class="ui-icon ui-icon-seek-end"></span></td>
                                        <td dir="ltr"><select class="ui-pg-selbox" role="listbox">
                                            <option role="option" value="100" selected="selected">100</option>
                                            <option role="option" value="200">200</option>
                                            <option role="option" value="500">500</option>
                                        </select></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </td>
                            <td id="page_right" align="right">
                                <div dir="ltr" style="text-align:right" class="ui-paging-info">1 - 6　共 6 条</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="../../js/judgment/coderuleList.js"></script>

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
</body>
</html>
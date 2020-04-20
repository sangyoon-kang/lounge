<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
 integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
 <style>
<!--
.ContractWrap{
margin-bottom:50px;
}
.print{
    border: 1px solid #ccc;  
}
.fa{
font-size: 200%;
color:black;
}
.cttxt_info p {
    display: inline-block;
    padding: 10px 5px 0px 5px;
}
.ctbox {
    width: 40%;
    float: left;
    padding: 10px 5px;
    text-align: center;
    margin-top: 40px;
    margin-left: 28px;
    margin-bottom: 30px;
    border: 5px solid #ccc;   
    height:130px;
     font-size: 0.85em;
}
.ctbox:last-child {
    width: 40%;
    float: right;
    padding: 10px 5px;
    text-align: center;
    margin-right: 28px;
}
.cttxt {
    text-align: center;
    background-color:#f2f2f2;
    word-wrap: normal;
    color: #30295f;
    font-size: 0.85em;
}
.cform_wrap h4 {
    margin: 20px auto;
    background: #f2f2f2;
    padding: 14px ;
    text-align: center;
    font-weight: 300;
    font-size: 0.85em;
}
.cform_wrap {
    font-size: 0.85em;
    padding: 10px;
}
.cform_wrap table tr td {
    padding: 10px;
    text-align: center;
    word-break: keep-all;
}
.tredB{
color:#ee3f5c;
display: block;
}
.tblue{
color:#3a47ad;
}
img{
width:24%;
}
.cform_wrap table thead tr td {
    border-top: 2px solid #666;
    border-bottom: 1px solid #666;
    padding: 5px;
}
.text-light{
background-color:#ff1a66;
 font-size: 20px;
}
.cform_wrap table tr td:nth-child(2n) {
    text-align: left;
}
.cform_wrap table tbody tr td:first-child {
    font-size: 0.85em;
}
-->
</style>
<div class="ContractWrap">
<div class="cw100">
    <div class="contract">
        <h1></h1>
        <a href="" class="print"><i class="fa fa-print" aria-hidden="true"></i></a>
    </div>
</div>
<div class="sub-visual">
     <div class="container">
          <div class="row">
               <div class="col-sm-12">
               <img src="/images/fx_assets/logo/${SITE_NAME_L}.png" alt="">
                     <h3>손익 분배 계약서<span class="text-light">매수</span></h3>
                    <h6>BUYING OFFER</h6>
               </div>
          </div>
     </div>
</div>
<div class="cw100">
            <div class="ctbox">
                <ul>
                   <li>W5,000 * 1</li>                
                </ul>
            </div>
            <div class="ctbox margin0">
                <strong>렌트시작</strong><br>
                5월 21일 10시 40분<span><br>
                <strong>렌트보증금</strong><br>
                    5,000</span>
            </div>
        </div>
        <div class=" cttxt">
            FX마진거래 손익분배 계약 보증금은 차손발생 시 귀속되는 계약입니다. <br> FX마진거래 렌트 계약을 취득하기 전에 ${URL_HOST_OP}에서 <br>반드시 이용약관 및
            설명서를 읽어보시고 계약하시기 바랍니다.
            <div class="cttxt_info">
                <img src="/images/fx_assets/logo/${SITE_NAME_L}.png" alt=""><span>|</span>
                <p>문의전화<b >1522-1206</b></p>
            </div>
        </div>
        <div class="cform_wrap cw100">
        <h4><i class="fas fa-exclamation-circle"></i>본 상품은 고객님께서 <b>계약하신 상품의 금액</b>만해당됩니다.</h4>
        <table>
            <thead>
                <tr>
                    <td>상품구분</td>
                    <td>당사보유(MOU) 금융투자(FX 마진거래 GBP/AUD)</td>
                </tr>
            </thead>
            <tbody>
                <tr style=" background-color:#f2f2f2;">
                    <td><b class="tredB">1랏의 10%(매수)</b>포지션 상품에서 발생될 <br>±손익에 대하여</td>
                    <td>렌트보증금 <b>$5(5,000)</b>으로 렌트시작 시각<br>
                        <b>(손익분배비율:14%)</b> 단위 <b>↓50</b> 실격<br>
                        <b class="tblue">₩5,000(차손)</b> 소멸종료 단위 <b>↑50</b> 실현 <b class="tred">₩4,300(차익)</b>
                                   지급종료
                    </td>
                </tr>
                <tr>
                    <td><b class="tredB">2랏의 10%(매수)</b>포지션 상품에서 발생될 <br> ±손익에 대하여</td>
                    <td>렌트보증금 <b>$5(10,000)</b>으로 렌트시작 시각<br>
                        <b>(손익분배비율:14%) </b>단위 <b>↓50</b> 실격<br>
                        <b class="tblue">₩5,000(차손)</b> 소멸종료 단위 <b>↑50</b> 실현 <b class="tred">₩4,300(차익)</b>
                        지급종료
                    </td>
                </tr>
                <tr  style=" background-color:#f2f2f2;">
                    <td><b class="tredB">1랏의 10%(매수)</b>포지션 상품에서 발생될  <br>±손익에 대하여</td>
                    <td>렌트보증금 <b>$5(5,000)</b>으로 렌트시작 시각<br>
                        <b>(손익분배비율:14%)</b> 단위 <b>↓50</b> 실격<br>
                        <b class="tblue">₩5,000(차손)</b> 소멸종료 단위 <b>↑50</b> 실현 <b class="tred">₩4,300(차익)</b>
                        지급종료
                    </td>
                </tr>
                <tr>
                    <td><b class="tredB">2랏의 10%(매수)</b>포지션 상품에서 발생될  <br>±손익에 대하여</td>
                    <td>렌트보증금 <b>$5(10,000)</b>으로 렌트시작 시각<br>
                        <b>(손익분배비율:14%) </b>단위 <b>↓50</b> 실격<br>
                        <b class="tblue">₩5,000(차손)</b> 소멸종료 단위 <b>↑50</b> 실현 <b class="tred">₩4,300(차익)</b>
                        지급종료
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<script src="/static/moment.js">
</script>
<script>
    (function(window, document, $) {
        $(function() {
            $('i.fa-print').on('click', function(e) {
                window.print();
            });
        });
    })(window, document, jQuery);
</script>


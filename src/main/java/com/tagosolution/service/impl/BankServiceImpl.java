package com.tagosolution.service.impl;

import com.tagoplus.model.common.SearchVO;
import com.tagosolution.service.model.BankVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.SocketException;
import java.security.Security;


/**
 * 페이지관리 서비스
 *
 * @author G.Tenger
 */
@Service("bankService")
public class BankServiceImpl extends BaseServiceImpl {
    @Value("#{globals['nice.bank.account.check.authId']}")
    private String authId;

    @Value("#{globals['nice.bank.account.check.authPw']}")
    private String authPassword;


    /**
     * Bank Delete
     *
     * @param search the search
     * @throws Exception the exception
     */
    public void deleteBank(SearchVO search) throws Exception {
        super.getDAO().delete("bank.deleteByKey", search.getBankSeq());
    }

    /**
     * Bank Save
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    public void insertBank(BankVO vo) throws Exception {
        super.getDAO().insert("bank.merge", vo);
    }


	/**
	 * Check account string.
	 *
	 * @param service      the service
	 * @param strGbn       the str gbn
	 * @param strResId     the str res id
	 * @param strNm        the str nm
	 * @param strBankCode  the str bank code
	 * @param strAccountNo the str account no
	 * @param svcGbn       the svc gbn
	 * @param strOrderNo   the str order no
	 * @param svc_cls      the svc cls
	 * @param inq_rsn      the inq rsn
	 * @return the string
	 */
	public String checkAccount(String service, String strGbn, String strResId, String strNm, String strBankCode, String strAccountNo, String svcGbn, String strOrderNo, String svc_cls, String inq_rsn) {

        String result = "";

        BufferedReader in = null;
        PrintWriter out = null;

        try {
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            SSLSocketFactory factory = (SSLSocketFactory) SSLSocketFactory.getDefault();
            SSLSocket soc = (SSLSocket) factory.createSocket("secure.nuguya.com", 443);

            // 타임아웃  +++++++++++++++++++++++++++++++++++++++++++++++++++++
            soc.setSoTimeout(10 * 1000);    // 타임아웃 10초
            soc.setSoLinger(true, 10);
            soc.setKeepAlive(true);
            // 타임아웃  +++++++++++++++++++++++++++++++++++++++++++++++++++++

            out = new PrintWriter(soc.getOutputStream());
            in = new BufferedReader(new InputStreamReader(soc.getInputStream()), 8 * 1024);

            result = rlnmCheck(out, in, authId, authPassword, service, strGbn, strResId, strNm, strBankCode, strAccountNo, svcGbn, strOrderNo, svc_cls, inq_rsn);

        } catch (SocketException e) {
            System.out.println(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (Exception e) {
                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {
                }
            }
        }

        return result;

    }

    /**
     * Rlnm check string.
     *
     * @param out          the out
     * @param in           the in
     * @param niceUid      the nice uid
     * @param svcPwd       the svc pwd
     * @param service      the service
     * @param strGbn       the str gbn
     * @param strResId     the str res id
     * @param strNm        the str nm
     * @param strBankCode  the str bank code
     * @param strAccountNo the str account no
     * @param svcGbn       the svc gbn
     * @param strOrderNo   the str order no
     * @param svc_cls      the svc cls
     * @param inq_rsn      the inq rsn
     * @return the string
     * @throws IOException the io exception
     */
    public String rlnmCheck(PrintWriter out, BufferedReader in, String niceUid, String svcPwd, String service, String strGbn, String strResId, String strNm, String strBankCode, String strAccountNo, String svcGbn, String strOrderNo, String svc_cls, String inq_rsn) throws IOException {
        StringBuffer sbResult = new StringBuffer();

        String contents = "niceUid=" + niceUid + "&svcPwd=" + svcPwd + "&service=" + service + "&strGbn=" + strGbn + "&strResId=" + strResId + "&strNm=" + strNm + "&strBankCode=" + strBankCode + "&strAccountNo=" + strAccountNo + "&svcGbn=" + svcGbn + "&strOrderNo=" + strOrderNo + "&svc_cls=" + svc_cls + "&inq_rsn=" + inq_rsn + "&seq=0000001";

        out.println("POST https://secure.nuguya.com/nuguya2/service/realname/sprealnameactconfirm.do HTTP/1.1"); //UTF-8 URL
        //out.println("POST https://secure.nuguya.com/nuguya/service/realname/sprealnameactconfirm.do HTTP/1.1");
        out.println("Host: secure.nuguya.com");
        out.println("Connection: Keep-Alive");
        out.println("Content-Type: application/x-www-form-urlencoded");
        out.println("Content-Length: " + contents.length());
        out.println();
        out.println(contents);
        out.flush();

        String line = null;
        int i = 0;
        boolean notYet = true;
        while ((line = in.readLine()) != null) {
            i++;
            if (notYet && line.indexOf("HTTP/1.") == -1) {
                continue;
            }
            if (notYet && line.indexOf("HTTP/1.") > -1) {
                notYet = false;
            }

            if (line.indexOf("HTTP/1.") > -1) {
                notYet = false;
            }
            if (line.startsWith("0")) {
                break;
            }
            if (line == null) {
                break;
            }

            if (i == 9) sbResult.append(line);
        }

        System.out.println(sbResult.toString());
        return sbResult.toString();
    }
}

<%@ page contentType="text/html;charset=GBK" pageEncoding="GBK" import="org.w3c.dom.Document,
																		org.w3c.dom.NodeList,
																		org.xml.sax.InputSource,
																		javax.xml.parsers.DocumentBuilder,
																		javax.xml.parsers.DocumentBuilderFactory,
																		java.io.*,
																		java.net.URL,
																		java.net.URLConnection" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Hashtable" %>

<%
    String post_url = "http://api.west263.com/API/";  //api��ַ��ʵ�ʵ�ַ���������뷢��Ϊ׼
    String userid = "apidemo";                       //����ӿ��û���
    String passwd = "west263apidemo";               //����ӿ�����
    String encoding = "GB2312";
/**
 *cmdstrng �� type  ��Ҫƥ��API�ӿڵ��õ�ֵ
 *
 **/
    String cmdstrng = "other" + "\r\n" + "get" + "\r\n" + "entityname:usemoney" + "\r\n" + "." + "\r\n"; //���������
//String cmdstrng = "other"+"\r\n"+"get"+"\r\n"+"entityname:oslist"+"\r\n"+"productid:tw001"+"\r\n"+"roomid:25"+"\r\n"+"."+"\r\n";
    String type = "usemoney";  //�����ȡ��Ϣ����

//����һ��hash�������в������Ӧֵ��������hash��
    Hashtable hash_data = new Hashtable();
    hash_data.put("post_url", post_url);
    hash_data.put("userid", userid);
    hash_data.put("passwd", passwd);
    hash_data.put("encoding", encoding);
    hash_data.put("cmdstrng", cmdstrng);
    hash_data.put("type", type);

//����һ�������Ͷ��� 
    FormPoster poster = new FormPoster(hash_data);

    try {
        //���Ͳ�ȡ����Ӧ
        String responseStr = poster.post();
        System.out.println(responseStr);

        Hashtable voldmap = string2Document(responseStr, hash_data.get("type").toString());
        String returncode = voldmap.get("returncode").toString();

        //returncode�ڵ�״̬Ϊ200����ʾ
        if (returncode.equals("200") && type.equals("usemoney")) {
            //��usemoney�ڵ��ֵȡ��
            out.write(hash_data.get("userid") + "�ʺŵĿ������Ϊ:");
            out.write("<font color=red>��" + voldmap.get("usemoney").toString() + "</font> Ԫ");
        } else if (returncode.equals("200") && type.equals("xinghao")) {

            for (int i = 0; i < voldmap.size(); i++) {
                out.write("����ϵͳ��");
                out.write(voldmap.get("osval" + i).toString() + "<p>");
                out.write("�������ͣ�");
                out.write(voldmap.get("osname" + i).toString() + "<p>");
            }

        } else {
            out.write("״̬����ȷ!");
        }

    } catch (Exception e) {
        //exception deal
        // out.write("��������ʧ�ܣ�<br>" + e.getMessage());
    }
%>

<%!
    //ʹ��һ��inner class��װPOST����
    public class FormPoster {
        private Hashtable data = null;

        public FormPoster(Hashtable postData) {
            this.data = postData;
        }

        //�ύ
        public String post() throws IOException, Exception {

            addExtendInfo();

            /**
             * ����Ҫ��URL�µ�URLConnection�Ի��� URLConnection���Ժ����׵Ĵ�URL�õ������磺 // Using
             * java.net.URL and //java.net.URLConnection
             */
            System.out.println(data.get("post_url"));
            String Surl = data.get("post_url").toString();
            URL url = new URL(Surl);
            URLConnection connection = url.openConnection();
            /**
             * Ȼ���������Ϊ���ģʽ��URLConnectionͨ����Ϊ������ʹ�ã���������һ��Webҳ��
             * ͨ����URLConnection��Ϊ���������԰����������Webҳ���͡��������������
             */
            connection.setDoOutput(true);
            /**
             * ���Ϊ�˵õ�OutputStream�������������Լ����Writer���ҷ���POST��Ϣ�У����磺 ...
             */
            OutputStreamWriter out = new OutputStreamWriter(connection .6 (), data.get("encoding").toString());
            out.write("user_account=admin&user_password=******"); // post�Ĺؼ����ڣ�
            // remember to clean up
            out.flush();
            out.close();
            /**
             * �����Ϳ��Է���һ����������������POST�� POST /jobsearch/jobsearch.cgi HTTP 1.0 ACCEPT:
             * text/plain Content-type: application/x-www-form-urlencoded
             * Content-length: 99 username=bob password=someword
             */
            // һ�����ͳɹ��������·����Ϳ��Եõ��������Ļ�Ӧ��
            String sCurrentLine;
            String sTotalString;
            sCurrentLine = "";
            sTotalString = "";
            InputStream l_urlStream;
            l_urlStream = connection.getInputStream();
            // �����װ
            BufferedReader l_reader = new BufferedReader(new InputStreamReader(
                    l_urlStream));
            while ((sCurrentLine = l_reader.readLine()) != null) {
                sTotalString += sCurrentLine + "\r\n";


            }

            return sTotalString;

        }

        //����֤��Ϣ����POST����
        private void addExtendInfo() {
            String auth_info = md5(data.get("userid").toString() + data.get("passwd").toString() + data.get("cmdstrng").toString().substring(0, 10));
            String sURL = data.get("post_url").toString() + "index.asp" + "?userid=" + data.get("userid") + "&versig=" + auth_info + "&strCmd=" + URLEncoder.encode(data.get("cmdstrng").toString());
            if (auth_info != null)
                data.put("post_url", sURL);
        }

        //md5 function MD5��������Ƿ�ASIIC�룬�����ڷ���ʱһ��ҪURL����
        public String md5(String s) {
            char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                    'a', 'b', 'c', 'd', 'e', 'f'};
            try {
                byte[] strTemp = s.getBytes();
                //ʹ��MD5����MessageDigest����
                java.security.MessageDigest mdTemp = java.security.MessageDigest.getInstance("MD5");
                mdTemp.update(strTemp);
                byte[] md = mdTemp.digest();
                int j = md.length;
                char str[] = new char[j * 2];
                int k = 0;
                for (int i = 0; i < j; i++) {
                    byte b = md[i];
                    //��û����(int)b����˫�ֽڼ���
                    str[k++] = hexDigits[b >> 4 & 0xf];
                    str[k++] = hexDigits[b & 0xf];
                }
                return new String(str);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }
    }

    public static Hashtable string2Document(String s, String c) {
        Document document = null;
        Hashtable voldmap = new Hashtable();
        try {
            DocumentBuilder parser = DocumentBuilderFactory.newInstance().newDocumentBuilder();
            document = parser.parse(new InputSource(new StringReader(s)));
            // ������
            if (c.equals("usemoney")) {
                NodeList returncode = document.getElementsByTagName("returncode");
                voldmap.put("returncode", returncode.item(0).getTextContent().toString()); //��ȡ״ֵ̬���̶�����
                System.out.println(returncode.item(0).getTextContent());

                NodeList list = document.getElementsByTagName("usemoney");// ��ȡ���
                voldmap.put("usemoney", list.item(0).getTextContent().toString());

                System.out.println(list.item(0).getTextContent());
            }
            // ��ò���ϵͳ
            else if (c.equals("xinghao")) {
                NodeList returncode = document.getElementsByTagName("returncode");
                voldmap.put("returncode", returncode.item(0).getTextContent().toString()); //��ȡ״ֵ̬���̶�����

                NodeList record = document.getElementsByTagName("record");
                NodeList osval = document.getElementsByTagName("osval");//���ز���ϵͳ
                NodeList osname = document.getElementsByTagName("osname");//���ز���������


                for (int i = 0; i < record.getLength(); i++) {
                    voldmap.put("osval" + i, osval.item(i).getTextContent());
                    voldmap.put("osname" + i, osname.item(i).getTextContent());
                    System.out.println(voldmap.get("osval" + i));
                    System.out.println(voldmap.get("osname" + i));
                }

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return voldmap;
    }

%>
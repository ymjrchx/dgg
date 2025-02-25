package net.dgg.zqq.framework.interceptor;

import net.dgg.zqq.entity.RequestRecord;
import net.dgg.zqq.framework.PTConst;
import net.dgg.zqq.utils.IpAddressUtils;
import net.dgg.zqq.utils.JsonUtils;
import org.apache.catalina.connector.RequestFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.data.mongodb.core.MongoTemplate;

import javax.servlet.*;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

public class RequestRecordFilter implements Filter {
    @Autowired
    private MongoTemplate mongoTemplate;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        RequestRecord record = new RequestRecord();

        RequestFacade requestFacade=(RequestFacade) servletRequest;
        record.setToken(requestFacade.getHeader(PTConst.USER_TOKEN));
        record.setIp(IpAddressUtils.getIP(requestFacade));
        record.setUrl(requestFacade.getRequestURI());
        record.setCreateTime(new Date());
        Map<String,String[]> paras= servletRequest.getParameterMap();
        String parasJson = JsonUtils.toJSONStringConvertNull(paras);
        record.setParasJson(parasJson);

        mongoTemplate.insert(record,"zqq_request_record");
    }

    @Override
    public void destroy() {

    }
}

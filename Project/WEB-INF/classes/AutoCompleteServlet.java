import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.Date;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.util.*;
import java.text.*;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;

import java.util.HashMap;
import java.util.*;
import java.util.Iterator;
import java.io.*;

public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    HashMap complist;
    String targetId=null;


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
        targetId = request.getParameter("searchId");


        if (targetId != null) {

            targetId = targetId.trim();
        } else {
            context.getRequestDispatcher("/error").forward(request, response);
        }

        boolean namesAdded = false;
        StringBuffer sb = new StringBuffer(); 
        if (action.equals("complete")) {

            if (!targetId.equals("")) 
            {   
    
                AjaxUtility a=new AjaxUtility(); 
                sb=a.readdata(targetId.toLowerCase()); 
                if(sb!=null || !sb.equals("")) 
                { 
                    namesAdded=true; 
                } 
                if (namesAdded) 
                { 
                    response.setContentType("text/xml"); 
                    response.getWriter().write("<products>" + sb.toString() + "</products>"); 
                } 
            }

            else 
            {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }
        if (action.equals("lookup")) 
        {
            complist=(HashMap)AjaxUtility.getData();  
          
            System.out.println(targetId.trim());
          
            if ((targetId != null) && complist.containsKey(targetId)) 
            {
                //request.setAttribute("ProductDetail",complist.get(targetId.trim()));
                //request.getRequestDispatcher("/ProductDetail").forward(request, response);
            }
        }
    }
}

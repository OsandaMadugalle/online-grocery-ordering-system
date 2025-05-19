package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.gos.model.DeliveryManager;
import com.gos.service.DeliveryManagerService;

@WebServlet("/AdminDeleteDeliveryManagerServlet")
public class AdminDeleteDeliveryManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /*    
   	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	DeliveryManager dM = new DeliveryManager();
        dM.setId(Integer.parseInt(request.getParameter("id")));

        /*
        InventoryManagerService delService = new InventoryManagerService();
        delService.deleteInventoryManager(IM);
        */
        
        DeliveryManagerService.deleteDeliveryManager(dM);

        System.out.println("Delete Delivery Manager Success");
        
        response.sendRedirect("manageDeliveryManager");
       // response.sendRedirect(request.getContextPath() + "/manageInventoryManager");
    }
}
package com.gos.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.gos.model.InventoryManager;
import com.gos.service.InventoryManagerService;

@WebServlet("/AdminDeleteInventoryManagerServlet")
public class AdminDeleteInventoryManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /*    
   	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    */

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InventoryManager IM = new InventoryManager();
        IM.setId(Integer.parseInt(request.getParameter("id")));

        /*
        InventoryManagerService delService = new InventoryManagerService();
        delService.deleteInventoryManager(IM);
        */
        
        InventoryManagerService.deleteInventoryManager(IM);

        response.sendRedirect("manageInventoryManager");
       // response.sendRedirect(request.getContextPath() + "/manageInventoryManager");
    }
}
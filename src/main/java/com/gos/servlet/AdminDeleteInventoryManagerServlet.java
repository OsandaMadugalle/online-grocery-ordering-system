package com.gos.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.gos.model.InventoryManager;
import com.gos.service.InventoryManagersService;


@WebServlet("/deleteInventoryManager")
public class AdminDeleteInventoryManagerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response); // Forward GET to POST
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InventoryManager IM = new InventoryManager();
        IM.setStock_manager_id(Integer.parseInt(request.getParameter("id")));

        InventoryManagersService delService = new InventoryManagersService();
        delService.deleteInventoryManager(IM);

        response.sendRedirect(request.getContextPath() + "/manageInventoryManager");
    }
}

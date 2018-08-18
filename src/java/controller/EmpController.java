/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.NhanVien;
import hibernate.HibernateUtil;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author MSI
 */
@Controller
public class EmpController {

    @RequestMapping("emp")
    public String showForm(ModelMap model) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        ArrayList<NhanVien> list = null;
        session.beginTransaction();
        String sql = "from NhanVien";
        Query query = session.createQuery(sql);
        list = (ArrayList) query.list();
        model.addAttribute("emp", list);
        session.close();
        return "emp";
    }

    @RequestMapping("emp_form")
    public String empForm() {
        return "emp_form";
    }
    
    @RequestMapping("emp_add")
    public String empAdd() {
        return "emp_add";
    }

    @RequestMapping("deleteEmp")
    public String deleteEmp(@RequestParam("empID") int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        NhanVien dp = getInfoEmp(id);
        try {
            session.getTransaction().begin();
            session.delete(dp);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println(e);
        }
        return "redirect:/emp.htm";
    }

    @RequestMapping("editEmp")
    public String editEmp(@RequestParam("name") String name,
            @RequestParam("address") String address,
            @RequestParam("gender") String gender,
            @RequestParam("id") int id
    ) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        NhanVien dp = getInfoEmp(id);
        try {
            session.getTransaction().begin();
            dp.setTennv(name);
            dp.setDiachi(address);
            dp.setGioitinh(gender);
            session.update(dp);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println(e);
        }
        return "redirect:/emp.htm";
    }

    @RequestMapping("addEmp")
    public String addEmp(@RequestParam("name") String name,
            @RequestParam("address") String address,
            @RequestParam("gender") String gender
    ) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        NhanVien emp = new NhanVien(name, address, gender);
        try {
            session.getTransaction().begin();
            session.save(emp);
            session.getTransaction().commit();
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println(e);
        }
        return "redirect:/emp.htm";
    }

    public static NhanVien getInfoEmp(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        NhanVien dp = (NhanVien) session.get(NhanVien.class, id);
        session.close();
        return dp;
    }

    public static void main(String[] args) {
        NhanVien e = getInfoEmp(1);
        System.out.println(e);
    }
}

package xml;

import java.util.ArrayList;

public class MakersXML {
    public String xmlNumEmpleados(String aux) {
        String res = "";
        String spc = "   ";
        String tab = "";
        res = TagsXml.tagIni(TagsXml.info) + "\n";
        tab = tab + spc;
        res = res + tab + TagsXml.tagIni(TagsXml.cantempleados) + "\n";
        res = res + tab + spc + aux + "\n";
        res = res + tab + TagsXml.tagFin(TagsXml.cantempleados) + "\n";
        res = res + TagsXml.tagFin(TagsXml.info) + "\n";
        return res;
    }
    public String xmlCountDepartamento(String aux) {
        String res = "";
        String spc = "   ";
        String tab = "";
        res = TagsXml.tagIni(TagsXml.info) + "\n";
        tab = tab + spc;
        res = res + tab + TagsXml.tagIni(TagsXml.cantempleados) + "\n";
        res = res + tab + spc + aux + "\n";
        res = res + tab + TagsXml.tagFin(TagsXml.cantempleados) + "\n";
        res = res + TagsXml.tagFin(TagsXml.info) + "\n";
        return res;
    }

    public String xmlEmpleado(String []aux) {
        String spc = "   ";
        String res = "";
        String tab = "";
        res = TagsXml.tagIni(TagsXml.info) + "\n";
        tab = tab + spc;
        res = res + makeEmpleado(aux, tab, spc) + "\n";
        res = res + TagsXml.tagFin(TagsXml.info) + "\n";
        return res;
    }

    public String xmlEmpleadoSimple(String []aux) {
        String spc = "   ";
        String res = "";
        String tab = "";
        res = res + makeEmpleado(aux, tab, spc) + "\n";
        return res;
    }

    public String xmlNEmpleados(ArrayList <String> aux) {
        String spc = "   ";
        String res = "";
        String tab = "";
        res = TagsXml.tagIni(TagsXml.info) + "\n";
        tab = tab + spc;
        res = res + tab + TagsXml.tagIni(TagsXml.nempleado) + "\n";
        tab = tab + spc;
        for (int k = 0; k < aux.size(); k++) {
           res = res + aux.get(k);
        }
        tab = tab.substring(0, tab.length() - spc.length());
        res = res + tab + TagsXml.tagFin(TagsXml.nempleado) + "\n";
        res = res + TagsXml.tagFin(TagsXml.info) + "\n";
        return res;
    }

    public String xmlSalaryEmploy(int emp_no, ArrayList <String> aux) {
        String spc = "   ";
        String res = "";
        String tab = "";
        res = TagsXml.tagIni(TagsXml.info) + "\n";
        tab = tab + spc;
        res = res + tab + TagsXml.tagIni(TagsXml.emp_no) + "\n";
        res = res + tab + spc + emp_no + "\n";
        res = res + tab + TagsXml.tagFin(TagsXml.emp_no) + "\n";
        res = res + tab + TagsXml.tagIni(TagsXml.salary_employ) + "\n";
        tab = tab + spc;
        for (int k = 0; k < aux.size(); k = k + 3) {
           res = res + tab + TagsXml.tagIni(TagsXml.one_salary) + "\n";
           res = res + tab + spc + TagsXml.tagIni(TagsXml.salary) + "\n";
           res = res + tab + spc + spc + aux.get(k) + "\n";
           res = res + tab + spc + TagsXml.tagFin(TagsXml.salary) + "\n";
           res = res + tab + spc + TagsXml.tagIni(TagsXml.from_date) + "\n";
           res = res + tab + spc + spc + aux.get(k+1) + "\n";
           res = res + tab + spc + TagsXml.tagFin(TagsXml.from_date) + "\n";
           res = res + tab + spc + TagsXml.tagIni(TagsXml.to_date) + "\n";
           res = res + tab + spc + spc + aux.get(k+2) + "\n";
           res = res + tab + spc + TagsXml.tagFin(TagsXml.to_date) + "\n";
           res = res + tab + TagsXml.tagFin(TagsXml.one_salary) + "\n";
        }
        tab = tab.substring(0, tab.length() - spc.length());
        res = res + tab + TagsXml.tagFin(TagsXml.salary_employ) + "\n";
        res = res + TagsXml.tagFin(TagsXml.info) + "\n";
        return res;
    }
    
    /* ******************** Métodos privados
          ****************************
    */
    private String makeEmpleado(String[] aux, String tab, String spc) {
        String res = "";
        res = res + tab + TagsXml.tagIni(TagsXml.empleado) + "\n";
        res = res + tab + spc + TagsXml.tagIni(TagsXml.emp_no) + "\n";
        res = res + tab + spc + spc + aux[0] + "\n";
        res = res + tab + spc + TagsXml.tagFin(TagsXml.emp_no) + "\n";
        res = res + tab + spc + TagsXml.tagIni(TagsXml.birth_date) + "\n";
        res = res + tab + spc + spc + aux[1] + "\n";
        res = res + tab + spc + TagsXml.tagFin(TagsXml.birth_date) + "\n";
        res = res + tab + spc + TagsXml.tagIni(TagsXml.first_name) + "\n";
        res = res + tab + spc + spc + aux[2] + "\n";
        res = res + tab + spc + TagsXml.tagFin(TagsXml.first_name) + "\n";
        res = res + tab + spc + TagsXml.tagIni(TagsXml.last_name) + "\n";
        res = res + tab + spc + spc + aux[3] + "\n";
        res = res + tab + spc + TagsXml.tagFin(TagsXml.last_name) + "\n";
        res = res + tab + spc + TagsXml.tagIni(TagsXml.gender) + "\n";
        res = res + tab + spc + spc + aux[4] + "\n";
        res = res + tab + spc + TagsXml.tagFin(TagsXml.gender) + "\n";
        res = res + tab + spc + TagsXml.tagIni(TagsXml.hire_date) + "\n";
        res = res + tab + spc + spc + aux[5] + "\n";
        res = res + tab + spc + TagsXml.tagFin(TagsXml.hire_date) + "\n";
        res = res + tab + TagsXml.tagFin(TagsXml.empleado);
        System.out.println(res);
        return res;
    }
}

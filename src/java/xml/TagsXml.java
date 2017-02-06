/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xml;

/**
 *
 * @author mascport
 */
public class TagsXml {
   static public final String info = "info";
   static public final String cantempleados = "cantempleados";
   static public final String nempleado = "nempleados";
   static public final String empleado = "empleado";
   static public final String emp_no = "emp_no";
   static public final String birth_date = "birth_date";
   static public final String first_name = "first_name";
   static public final String last_name = "last_name";
   static public final String gender = "gender";
   static public final String hire_date = "hire_date";
   static public final String salary_employ = "salary_employ";
   static public final String one_salary = "one_salary";
   static public final String salary = "salary";
   static public final String from_date = "from_date";
   static public final String to_date = "to_date";
   
   static public String tagIni(String s) {
       String res = "<" + s + ">";
       return res;
   }
   
   static public String tagFin(String s) {
       String res = "</" + s + ">";
       return res;
   }
}

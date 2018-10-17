using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class AntecedentesBLL
    {
        public string fk_paciente_rut { get; set; }
        public string patologicos { get; set; }
        public string quirurgicos { get; set; }
        public string alergicos { get; set; }
        public string ginecologicos { get; set; }
        public string psiquiatricos { get; set; }
        public string familiares { get; set; }
        


        public void Crear()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Antecedentes ante = new Antecedentes();

            ante.fk_paciente_rut = this.fk_paciente_rut;
            ante.patologicos = this.patologicos;
            ante.quirurgicos = this.quirurgicos;
            ante.alergicos = this.alergicos;
            ante.ginecologicos = this.ginecologicos;
            ante.psiquiatricos = this.psiquiatricos;
            ante.familiares = this.familiares;

            modelo.Antecedentes.Add(ante);
            modelo.SaveChanges();
        }

        public void Editar()
        {
            DB_GiacamanEntities modelo = new DB_GiacamanEntities();

            Antecedentes ante = (from an in modelo.Antecedentes where an.fk_paciente_rut.Equals(this.fk_paciente_rut) select an).FirstOrDefault();

            ante.patologicos = this.patologicos;
            ante.quirurgicos = this.quirurgicos;
            ante.alergicos = this.alergicos;
            ante.ginecologicos = this.ginecologicos;
            ante.psiquiatricos = this.psiquiatricos;
            ante.familiares = this.familiares;

            modelo.SaveChanges();
        }

        //public void eliminar

        

        
        
        

    }
}

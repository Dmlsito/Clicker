using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace PracticandoParaElExamen
{
    public partial class Ej7 : Form
    {


       BindingList<Alumno> listaAlumnos = new BindingList<Alumno>();

        public Ej7()
        {
            InitializeComponent();
            //Para que se cargue de primeras el gridView
            dataGridView1.DataSource = listaAlumnos;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        
        }

        public void botonAlta_Click(object sender, EventArgs e)
        {
            //Aplicamos la funcion de alta, para que se añada el alumno a la gridView
            alta();
        }

         void alta()
        {
            //Añadimos el objeto a la gridView
            listaAlumnos.Add(new Alumno
            {
                nombre = textBox1.Text.ToString(),
                apellidos = textBox2.Text.ToString(),
                edad = Int32.Parse(textBox3.Text),
            }); ;

        }

        private void botonBorrar_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Hola a todos", "Mensaje de prueba",

                MessageBoxButtons.OKCancel);
               
        }
    }



}

 


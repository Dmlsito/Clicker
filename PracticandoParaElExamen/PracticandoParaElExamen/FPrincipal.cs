using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PracticandoParaElExamen
{
    public partial class FPrincipal : Form
    {
        public FPrincipal()
        {
            InitializeComponent();
            Load();
        }
        private void Load()
        {
            BackColor = Color.LimeGreen;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            //Este boton nos lleva al formulario donde estara el segundo ejercicio
            Form formulario = new Ej1();
            formulario.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form formulario = new Ej2();
            formulario.ShowDialog();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form formulario = new Ej3();
            formulario.ShowDialog();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Form formulario = new Ej4();
            formulario.ShowDialog();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form formulario = new Ej5();
            formulario.ShowDialog();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form formulario = new Ej6();
            formulario.ShowDialog();
        }

        private void button8_Click(object sender, EventArgs e)
        {
          
            Form formulario = new Ej7();
            formulario.ShowDialog();
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();

        }

        private void button9_Click(object sender, EventArgs e)
        {
            Form formulario = new Ej9();
            formulario.ShowDialog();

        }

        private void button10_Click(object sender, EventArgs e)
        {
            Form formulario = new Ej10();
            formulario.ShowDialog();

        }
    }
}
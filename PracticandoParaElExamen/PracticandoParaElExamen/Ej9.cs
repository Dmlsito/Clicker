using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace PracticandoParaElExamen
{
    public partial class Ej9 : Form
    {

        ErrorProvider errorProvider = new ErrorProvider();
        int contador = 0;
      
        public Ej9()
        {
            InitializeComponent();
            
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            comprobacionNombre();
        }

        private void comprobacionNombre()
        {
            if (textBox1.Text != textBox1.Text.ToUpper())
            {
                errorProvider.SetError(textBox1, "Solo se pueden escribir en mayusculas");
            }
            else
            {
                errorProvider.SetError(textBox1, "");
            }
        }

       

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            comprobacionEmail();
        }

        private void comprobacionEmail()
        {
            if (textBox2.Text.Contains("@@"))
            {
                errorProvider.SetError(textBox2, "Solo se le permite tener al");
            }
            else
            {
                errorProvider.SetError(textBox2, "");
            }
        }

        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            /*Solo se podran escribir letras mayusculas
            if (!char.IsUpper(e.KeyChar))
            {
                e.Handled = true;
            }

            if(e.KeyChar == Convert.ToChar(Keys.Enter))
            {
                textBox2.Focus();
            }*/

            if(!System.Text.RegularExpressions.Regex.IsMatch(textBox3.Text, " ^ [0-9]"))
            {
                errorProvider.SetError(textBox)
            }
        }
    }
}

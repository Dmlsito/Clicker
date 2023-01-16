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
    public partial class Ej1 : Form
    {
        public Ej1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //Recogemos el texto del textBox en el label1
            label1.Text = textBox1.Text;
            //Seteamos a true que el poder ver el label 
            label1.Visible = true;
        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace PracticandoParaElExamen
{
    public partial class Ej3 : Form
    {
        public Ej3()
        {
            InitializeComponent();
         
        }

       
           

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
           {
             pictureBox1.Image = Properties.Resources.Ferrari_negro;
         }
            if (radioButton3.Checked)
          {
             pictureBox1.Image = Properties.Resources.Bugatti_negro;
          }
          if (radioButton2.Checked)
          {
            pictureBox1.Image = Properties.Resources.Maseratti_negro;
          }
        }
       }
}

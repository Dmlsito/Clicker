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
    public partial class Ej2 : Form
    {
        public Ej2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                checkBox1.Font = new System.Drawing.Font(checkBox1.Font, FontStyle.Bold);
            }
            if (checkBox2.Checked)
            {
                checkBox2.Font = new System.Drawing.Font(checkBox2.Font, FontStyle.Bold);
            }
        }
    }
}

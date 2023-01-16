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
    public partial class Ej6 : Form
    {

        int contador = 0;
        public Ej6()
        {
            InitializeComponent();
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            label1.Text = trackBar1.Value.ToString();
            progressBar1.Value = trackBar1.Value;
            
            timer1.Enabled = true;
            timer1.Start();
        }

        private void progressBar1_Click(object sender, EventArgs e)
        {
           
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            progressBar1.Value--;
            contador++;
            Console.WriteLine(contador.ToString());
            label2.Text = progressBar1.Value.ToString();
            if (progressBar1.Value == 0)
            {
                timer1.Stop();
            }

        }
    }
}

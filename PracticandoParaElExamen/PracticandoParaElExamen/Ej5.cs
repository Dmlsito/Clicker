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
   

    public partial class Ej5 : Form

    {
        int contador = 67 ;
        public Ej5()
        {
            InitializeComponent();
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            label.Text = contador.ToString();
            contador--;
            
            Console.WriteLine(contador.ToString());
        }

        private void button_Click(object sender, EventArgs e)
        {

            //Parsemaos el valor del textBox a un entero para poder asiganarselo a la variable contador
            contador = Int32.Parse(textBox.Text);
            //El timer empieza
            timer.Enabled = true;
            timer.Start();
           
        }
    }
}

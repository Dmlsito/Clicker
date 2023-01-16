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
    public partial class Ej4 : Form
    {
        public Ej4()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(comboBox1.SelectedIndex == 0)
            {
                //Lo primero de todo, tenemos que limpiar la listBox 
                listBox1.Items.Clear();
                listBox1.Items.Add("Para Elisa");
                listBox1.Items.Add("Cantat 147");
                listBox1.Items.Add("Invitacion a la Danza");
            }
            if (comboBox1.SelectedIndex == 1)
            {
                //Lo primero de todo, tenemos que limpiar la listBox 
                listBox1.Items.Clear();
                listBox1.Items.Add("Poker face");
                listBox1.Items.Add("Your song");
                listBox1.Items.Add("Take on me ");
            }
            if (comboBox1.SelectedIndex == 2)
            {
                //Lo primero de todo, tenemos que limpiar la listBox 
                listBox1.Items.Clear();
                listBox1.Items.Add("Wake up");
                listBox1.Items.Add("Something just like this");
                listBox1.Items.Add("Faded");
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(comboBox1.SelectedIndex == 0 && listBox1.SelectedIndex == 0) {

               
            }
        }
    }
}

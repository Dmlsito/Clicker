using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using PracticandoParaElExamen.Resources;

namespace PracticandoParaElExamen
{
    public partial class Ej10 : Form
    {
        String saludo = "Hola mundo";
        public Ej10()
        {
            InitializeComponent();
        }

        private void comboIdiomas_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(comboIdiomas.SelectedIndex == 0)
            {
                elementosEspañol();
                MessageBox.Show(CultureInfo.CurrentCulture.Name);
            }
            if (comboIdiomas.SelectedIndex == 1)
            {
                elementosIngles();
                MessageBox.Show(CultureInfo.CurrentCulture.Name);
            }
        }


        private void elementosEspañol()
        {
            CultureInfo culture = new CultureInfo("es-ES");
            Thread.CurrentThread.CurrentCulture = culture;

            //Limpiamos el comboBox
            comboIdiomas.Items.Clear();
            comboIdiomas.Items.Add(GenericoItemEspañolEspañol.Item1);
            comboIdiomas.Items.Add(GenericoInlgesEspañol.Item2);
            lablIdioma.Text = GenericoIdiomaEspañol.LabelIdioma;
            btnSaludar.Text = GenericoTextoBoton.TextoBoton;
            saludo = GenericoSaludoEspañol.Saludo;


        }
        private void elementosIngles() {


            CultureInfo cultura = new CultureInfo("en-US");
            Thread.CurrentThread.CurrentCulture = cultura;

            //Limpiamos el comboBox 
            comboIdiomas.Items.Clear();
            lablIdioma.Text = GenericoLabelIdiomaIngles.Label;
            comboIdiomas.Items.Add(GenericoComboItemEspañolIngles.Español);
            comboIdiomas.Items.Add(GenericoComboItemInglesIngles.Ingles);
            btnSaludar.Text = GenericoBotonTextoIngles.Saludo;
            saludo = GenericoSaludoIngles.Variable;



        }

        private void btnSaludar_Click(object sender, EventArgs e)
        {
            MessageBox.Show(saludo);
        }
    }
}

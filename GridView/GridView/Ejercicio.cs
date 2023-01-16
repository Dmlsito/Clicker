using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Serialization;
using Microsoft.Win32;

namespace GridView
{
    public partial class Ejercicio : Form
    {

        BindingList<Empleado> listaEmpleados = new BindingList<Empleado>();
        ErrorProvider errorProvider = new ErrorProvider();
        public Ejercicio()
        {
            InitializeComponent();
            dataGridView.DataSource = listaEmpleados;
            Load();
        }

        private void Load()
        {
            //Fondo azul
            BackColor = Color.Aquamarine;

        }

        private void buttonAgregar_Click(object sender, EventArgs e)
        {
            agregar();
        }

        private void agregar()
        {
            listaEmpleados.Add(new Empleado
            {
                nombre = textBoxNombre.Text,
                apellidos = textBoxApellidos.Text,
                contratoFijo = bool.Parse(textBoxContratoFijo.Text),
                edad = Int32.Parse(textBoxEdad.Text)
            });

        }

        private void borrar()
        {
            for (int i = 0; i < listaEmpleados.Count; i++)
            {

                if (textBoxNombre.Text == listaEmpleados[i].nombre && textBoxApellidos.Text == listaEmpleados[i].apellidos && bool.Parse(textBoxContratoFijo.Text) == listaEmpleados[i].contratoFijo &&
                    Int32.Parse(textBoxEdad.Text) == listaEmpleados[i].edad)
                {

                    listaEmpleados.Remove(listaEmpleados[i]);
                }
            }
        }

        private void buttonBorrar_Click(object sender, EventArgs e)
        {
            borrar();
        }


        private void cambiarIdioma()
        {
            if (comboBox1.SelectedIndex == 0)
            {


                CultureInfo culturaEspañola = new CultureInfo("es-Es");
                Thread.CurrentThread.CurrentCulture = culturaEspañola;

                //Borramos los items del comboBox para que solo se encuentren los creados a continuacion
                comboBox1.Items.Clear();
                comboBox1.Items.Add(Properties.GenericoItem1Español.Español);
                comboBox1.Items.Add(Properties.GenericoItem2Español.Ingles);
                labelIdioma.Text = Properties.GenericoLblIdiomaEspañol.Lbl;
                buttonAgregar.Text = Properties.GenericoBtnTextEspañol.Txt;
                buttonBorrar.Text = Properties.GenericoBtnBorrarEspañol.Txt;
                labelNombre.Text = Properties.GenericoLblNombreEspañol.Nombre;
                labelApellidos.Text = Properties.GenericoLblApellidosEspañol.Apellidos;
                labelContratoFijo.Text = Properties.GenericoLblContratoFijoEspañol.ContratoFijo;
                labelEdad.Text = Properties.GenericoLblEdadEspañol.Edad;

            }
            if (comboBox1.SelectedIndex == 1)
            {
                
                CultureInfo culturaIngles = new CultureInfo("en-US");
                Thread.CurrentThread.CurrentCulture = culturaIngles;

                comboBox1.Items.Clear();
                comboBox1.Items.Add(Properties.GenericoItem1Ingles.Spanish);
                comboBox1.Items.Add(Properties.GenericoItem2Ingles.English);
                labelIdioma.Text = Properties.GenericoLblIdiomaIngles.Language;
                buttonAgregar.Text = Properties.GenericoBtnAgregarIngles.Add;
                buttonBorrar.Text = Properties.GenericoBtnBorrarIngles.Remove;
                labelNombre.Text = Properties.GenericoLblNombreIngles.Name;
                labelApellidos.Text = Properties.GenericoLblApellidosIngles.Surnames;
                labelContratoFijo.Text = Properties.GenericoLblContratoFijoIngles.PermanentContract;
                labelEdad.Text = Properties.GenericoLblEdadIngles.Age;

            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            cambiarIdioma();
        }


        private void comprobacionNombre(KeyPressEventArgs e)
        {
            if (!char.IsUpper(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                textBoxNombre.Focus();
            }
        }

        private void textBoxNombre_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBoxNombre_KeyPress(object sender, KeyPressEventArgs e)
        {
            comprobacionNombre(e);
        }

        private void comprobacionEdad(KeyPressEventArgs e)

        {
         if(!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void textBoxEdad_KeyPress(object sender, KeyPressEventArgs e)
        {
            comprobacionEdad(e);
        }

        private void textBoxEdad_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}

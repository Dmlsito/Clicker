namespace PracticandoParaElExamen
{
    partial class Ej10
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.comboIdiomas = new System.Windows.Forms.ComboBox();
            this.lablIdioma = new System.Windows.Forms.Label();
            this.btnSaludar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // comboIdiomas
            // 
            this.comboIdiomas.FormattingEnabled = true;
            this.comboIdiomas.Items.AddRange(new object[] {
            "Español",
            "Ingles"});
            this.comboIdiomas.Location = new System.Drawing.Point(78, 68);
            this.comboIdiomas.Name = "comboIdiomas";
            this.comboIdiomas.Size = new System.Drawing.Size(121, 21);
            this.comboIdiomas.TabIndex = 0;
            this.comboIdiomas.SelectedIndexChanged += new System.EventHandler(this.comboIdiomas_SelectedIndexChanged);
            // 
            // lablIdioma
            // 
            this.lablIdioma.AutoSize = true;
            this.lablIdioma.Location = new System.Drawing.Point(107, 43);
            this.lablIdioma.Name = "lablIdioma";
            this.lablIdioma.Size = new System.Drawing.Size(38, 13);
            this.lablIdioma.TabIndex = 1;
            this.lablIdioma.Text = "Idioma";
            // 
            // btnSaludar
            // 
            this.btnSaludar.Location = new System.Drawing.Point(394, 66);
            this.btnSaludar.Name = "btnSaludar";
            this.btnSaludar.Size = new System.Drawing.Size(75, 23);
            this.btnSaludar.TabIndex = 2;
            this.btnSaludar.Text = "Saludar";
            this.btnSaludar.UseVisualStyleBackColor = true;
            this.btnSaludar.Click += new System.EventHandler(this.btnSaludar_Click);
            // 
            // Ej10
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnSaludar);
            this.Controls.Add(this.lablIdioma);
            this.Controls.Add(this.comboIdiomas);
            this.Name = "Ej10";
            this.Text = "Ej10";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox comboIdiomas;
        private System.Windows.Forms.Label lablIdioma;
        private System.Windows.Forms.Button btnSaludar;
    }
}
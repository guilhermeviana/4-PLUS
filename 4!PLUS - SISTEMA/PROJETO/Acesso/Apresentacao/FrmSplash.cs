﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Apresentacao
{
    public partial class FrmSplash : Form
    {
        
        public FrmSplash()
        {
            InitializeComponent();
        }

        private void progressBar1_Click(object sender, EventArgs e)
        {
   



        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            if (progressBar1.Value < 100)
            {
                progressBar1.Value = progressBar1.Value + 2;
                

                
            }

            else
            {

                timer1.Enabled = false;
                this.Visible = false;

                FrmLogin frmLogin = new FrmLogin();
                frmLogin.ShowDialog();
               

               
            }
            
        }

        private void FrmSplash_Load(object sender, EventArgs e)
        {
           
        }
    }
}

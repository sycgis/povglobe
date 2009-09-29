using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;
using Microsoft.Win32;
using System.Drawing;

namespace BitmapToByteArray
{
    /// <summary>
    /// Interaction logic for Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();
            if(open.ShowDialog() == true)
            {
                Bitmap bitmap = new Bitmap(open.FileName);
                byte[] bitmapBytes;
 
                //using(System.IO.MemoryStream stream = new MemoryStream())
                //{
                //    bitmap.Save(stream, bitmap.RawFormat);
                //    bitmapBytes = stream.ToArray();
                //}

                var size = bitmap.Size;

                //textBox1.Text = "bool[" + size.Height + "][" + size.Width + "] = {";

                StringBuilder builder = new StringBuilder();

                builder.Append("bool[" + size.Height + "][" + size.Width + "] = {");

                bool isFirst = true;
                for (int i = 0; i < size.Height; i++)
                {
                    builder.Append(isFirst ? "{ " : ", {");
                    isFirst = false;
                    bool isFirstInner = true;

                    for (int j = 0; j < size.Width; j++)
                    {
                        builder.Append(isFirstInner ? "" : ", ");
                        isFirstInner = false;
                        builder.Append(bitmap.GetPixel(j, i).B == 255 ? 1 : 0);

                    }

                    builder.Append("}");
                }
                builder.Append(@"}
                ");

                textBox1.Text = builder.ToString();

            }
        }
    }
}

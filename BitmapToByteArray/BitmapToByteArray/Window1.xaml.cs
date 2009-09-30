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

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();
            if (open.ShowDialog() == true)
            {
                Bitmap bitmap = new Bitmap(open.FileName);

                var size = bitmap.Size;

                StringBuilder builder = new StringBuilder();

                builder.Append(string.Format(@"#define ImageColumns {0}
#define ImageRows {1}
#define LEDEights {2}


",
                                             size.Width, size.Height, size.Height/8));

                builder.Append("prog_uchar Image[ImageColumns][LEDEights] PROGMEM = {");

                bool isFirst = true;
                for (int j = 0; j < size.Width; j++)
                {
                    builder.Append(isFirst ? "{ " : ", {");
                    isFirst = false;
                    bool isFirstInner = true;

                    int b = 0;
                    string bstring = "";
                    for (int i = 0; i < size.Height; i++)
                    {
                        if (b == 0)
                        {
                            builder.Append(isFirstInner ? "B" : ", B");
                            isFirstInner = false;
                        }

                        bstring = bstring.Insert(0, bitmap.GetPixel(j, i).B == 255 ? "1" : "0");
                        //builder.Append(bitmap.GetPixel(j, i).B == 255 ? 1 : 0);

                        b++;
                        if (b == 8)
                        {
                            builder.Append(bstring);
                            bstring = "";
                            b = 0;
                        }
                    }
                    if (b > 0)
                    {
                        for (; b < 8; b++)
                        {
                            bstring = bstring.Insert(0, "0");
                            //builder.Append(0);
                        }
                        builder.Append(bstring);
                    }

                    builder.Append("}");
                }
                builder.Append(@"};
                ");

                textBox1.Text = builder.ToString();

            }
        }
    }
}

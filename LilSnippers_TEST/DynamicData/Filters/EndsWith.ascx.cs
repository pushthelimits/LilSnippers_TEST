using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Linq.Expressions;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using NotAClue.Web.DynamicData;
using NotAClue.Web;

namespace LilSnippers_TEST
{
    public partial class EndsWithFilter : System.Web.DynamicData.QueryableFilterUserControl
    {
        public override Control FilterControl
        {
            get { return TextBox1; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!Column.ColumnType.Equals(typeof(String)))
                throw new InvalidOperationException(String.Format("A string filter was loaded for column '{0}' but the column has an incompatible type '{1}'.",
                    Column.Name, Column.ColumnType));

            if (DefaultValue != null)
                TextBox1.Text = DefaultValue;

            TextBox1.ToolTip = this.AppRelativeVirtualPath.GetFileNameTitle();
        }

        public override IQueryable GetQueryable(IQueryable source)
        {
            if (String.IsNullOrEmpty(TextBox1.Text))
                return source;

            object value = TextBox1.Text;
            if (DefaultValues != null)
                DefaultValues[Column.Name] = value;

            var whereCall = LinqExpressionHelper.BuildCustomQuery(source, Column.Table, Column, TextBox1.Text, QueryType.EndsWith);

            return source.Provider.CreateQuery(whereCall);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OnFilterChanged();
        }

        protected void btnRangeButton_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            if (button.ID == btnClear.ID)
                TextBox1.Text = String.Empty;

            OnFilterChanged();
        }
    }
}

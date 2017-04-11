<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebCommandLaucher.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />
    
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <script>
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
   <div class="container-fluid">
        <h1>Reperibilità</h1>
        <div>       
             <div>
                 <h4>Cellulare reperibile</h4>
             </div>
             <h3><asp:Label runat="server" ID="labelReperibile" /></h3>
             
             <asp:Button runat="server" ID="buttonGet" Text="Leggi numero reperibile" OnClick="buttonGet_Click" />
             <hr />
             <div>
                 <h4>Elenco reperibili</h4>
             </div>
			 <p></p>
             <div>
                 <asp:DropDownList runat="server" ID="dropDownReperibili" style="font-size:12pt;" >
                        </asp:DropDownList>
             </div>
			 <p></p>
             <asp:Button runat="server" ID="buttonSet" Text="Imposta reperibile" OnClick="buttonSet_Click" />
			 <hr />
        </div>
    </div>

    </form>
</body>
</html>

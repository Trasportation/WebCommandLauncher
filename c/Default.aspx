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
</head>
<body>
    <form id="form1" runat="server">
    <div class="container-fluid">
        <h1>Reperibilità</h1>
        <div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#getreperibile" aria-controls="home" role="tab" data-toggle="tab">Reperibile</a></li>
                <li role="presentation"><a href="#setreperibile" aria-controls="profile" role="tab" data-toggle="tab">Imposta reperibile</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content" style="">
                <div role="tabpanel" class="tab-pane active" id="getreperibile">
                    <asp:Label runat="server" ID="labelReperibile" />
                </div>
                <div role="tabpanel" class="tab-pane" id="setreperibile">
                    <asp:DropDownList runat="server">

                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>

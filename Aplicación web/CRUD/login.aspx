<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CRUD.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css" />
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <style>
        .contenedor-texfield{
            margin: 0px 120px;
            text-align:center;
        }
        .demo-card-wide.mdl-card {
            margin: 150px auto;
            width: 512px;
        }

        .demo-card-wide > .mdl-card__title {
            color: #fff;
            height: 176px;
            background: url('../Imagen/welcome_card.jpg') center / cover;
        }

        .demo-card-wide > .mdl-card__menu {
            color: #fff;
            text-align:center;
        }

        body {
            background-image: url('../Imagen/material-design-stock-4k-y7.jpg');
            background-position: center;
            background-repeat: no-repeat;
            background-size: auto;
        }
    </style>
    <title></title>
</head>
<body>
    <div class="demo-card-wide mdl-card mdl-shadow--2dp">
        <div class="mdl-card__title">
            <h2 class="mdl-card__title-text">Bienvenido</h2>
        </div>
        <div class="mdl-card__supporting-text">
                <%--<div class ="contenedor-texfield">--%>
                    <form id="form1" runat="server">
                        <div class="Panel contenedor-texfield">
                            <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/index.aspx" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderPadding="10" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" OnAuthenticate="Login1_Authenticate">
                                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                                <LoginButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" />
                                <TextBoxStyle Font-Size="0.8em" />
                                <TitleTextStyle BackColor="#507CD1" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                            </asp:Login>
                        </div>
                    <%--<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="tx_user" />
                        <label class="mdl-textfield__label" for="sample3">Usuario</label>
                    </div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                        <input class="mdl-textfield__input" type="text" id="tx_password" />
                        <label class="mdl-textfield__label" for="sample3">Contraseña</label>
                    </div>--%>
                    </form>
                <%--</div>--%>
        </div>
        <div class="mdl-card__actions mdl-card--border" style="text-align:center;">
        </div>
        <div class="mdl-card__menu">
            <button class="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect">
                <i class="material-icons">help_outline</i>
            </button>
        </div>
    </div>
</body>
</html>

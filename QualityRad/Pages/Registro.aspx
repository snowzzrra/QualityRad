<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="QualityRad.Pages.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        .container {
            background-color: #00ADEE;
            justify-items: center;
            align-items: center;
            justify-content: center;
            width: 100vw;
            height: 100vh;
            display: flex;
        }

        .register {
            padding: 15px;
            display: table-column;
            background-color: #FFFFFF;
            border-radius: 10px;
            width: 19%;
            height: auto;
            justify-content: left;
        }

        .form-item-title {
            margin-bottom: 3px;
            margin-top: 10px;
            font-size: 18px;
            text-align: left;
            font-weight: bold;
            color: #000000;
            margin-right: 0;
        }

        .form-item {
            margin-bottom: 10px;
            border-radius: 3px;
            border: none;
            padding: 10px;
            background-color: #EDF0F7;
            border: 1px solid #ADB5BD;
            width: 90%;
            height: 60%;
        }

        .form-button {
            margin-top: 15px;
            border-radius: 3px;
            border: none;
            padding: 10px;
            background-color: #00ADEE;
            color: #fff;
            font-weight: 900;
            cursor: pointer;
        }

        .form-button:hover {
            background-color: #0096D6;
        }

        .alreadyaccount {
            text-decoration: none;
            margin-top: 10px;
            font-size: 11px;
            text-align: center;
            color: #0096D6;
            cursor: pointer;
            font-weight: bold;
        }

        .alreadyaccount:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="register">
                <asp:TextBox runat="server" ID="nameTextBox" CssClass="form-item" placeholder="Razão social" />
                <asp:TextBox runat="server" ID="emailTextBox" CssClass="form-item" placeholder="Email" />
                <asp:TextBox runat="server" ID="passwordTextBox" CssClass="form-item" TextMode="Password" placeholder="Senha" />
                <asp:TextBox runat="server" ID="passwordConfirmTextBox" CssClass="form-item" TextMode="Password" placeholder="Confirmar senha" />
                <asp:TextBox runat="server" ID="phoneTextBox" CssClass="form-item" placeholder="Telefone" />
                <asp:Button runat="server" ID="registerButton" CssClass="form-button" Text="REGISTRAR-SE" OnClick="RegisterButton_Click" />

                <a href="#" class="alreadyaccount">Já tem uma conta?</a>
            </div>
        </div>
    </form>
</body>
</html>


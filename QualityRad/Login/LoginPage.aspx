<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="QualityRad.Login.LoginPage" MasterPageFile="~/Site.Master" Title ="Login" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">

    <style>
html, body {
    margin: 0 0;
    padding: 0;
    width: 100%;
    height: 100%;
    background-color: #00ADEE;
}

.container {
    display: flex;
    flex-direction: row;
    width: 100%;
    height: 100%;
    padding: 0;
}

.login {
    width: 30%;
    height: 100%;
    display: flex;
    background-color: #F2F2F2;
    border-radius: 10px;
    flex-direction: column;
    padding: 8rem 15px 0 15px;
    align-items: center;
}

.login img{
    width: 200px;
    height: auto;
}

.login h3{
    font-weight: bold;
    margin-bottom: 4rem;
}

.form-item {
    margin-bottom: 10px;
    border-radius: 3px;
    border: none;
    padding: 10px;
    background-color: #EDF0F7;
    border: 1px solid #ADB5BD;
    width: 90%;

}

.baixo {
    display: flex;
    flex-direction: column;
    width: 90%;
    align-items: center;
    margin-top: 15px;
}

.btn {
     margin-top: 15px;
     border-radius: 5px;
     border: none;
     padding: 10px;
     background-color: #00ADEE;
     color: #fff;
     font-weight: 900;
     cursor: pointer;
     width: 100%;
}

.btn:hover {
     background-color: #0096D6;
}

.esqueceuasenha {
     text-decoration: none;
     margin-top: 10px;
     font-size: 11px;
     text-align: center;
     color: #0096D6;
     cursor: pointer;
     font-weight: bold;
}

.esqueceuasenha:hover {
    text-decoration: underline;
}

.image-decoration{
    width: 70%;
}

.image-decoration img{
    width: 100%;
    height: 100%;
}

.label-login{
    color: darkgray;
    margin-bottom: 2px;
    font-size: 13px;
    font-weight: bold;
    text-align: left;
    width: 25rem;
}

.form-control:first-of-type{
    margin-bottom: 1.8rem;
}

.form-control{
    background-color: #EDF0F7;
}

@media (max-width: 48rem){
    .image-decoration{
        display: none;
    }

    .login{
        width: 100%;
    }

    .container{
        display: initial;
    }
}

    </style>
<div style="height: 100%;">
    <div id="form1" style="height: 100%;" runat="server">
        <div class="container">
            <div class="login">
                <img src="../Resources/logo-qualityrad.png" />
                <h3>Bem-vindo!</h3>
               <asp:Label ID="lblEmail" runat="server" CssClass="label-login">Email:</asp:Label>
               <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox>
               <asp:Label ID="lblSenha" runat="server" CssClass="label-login">Senha:</asp:Label>
               <asp:TextBox ID="tbxSenha" CssClass="form-control" runat="server" TextMode="Password" ></asp:TextBox> 
                
               <div class="baixo">
                   <asp:Button runat="server" ID="btnLogin" CssClass="btn btn-success" Text="LOGIN" OnClick="btnLogin_Click" />
                   <hr style="margin-top:20px; width:100%; border:1px solid #d6d6d6;" />
                   <a href="#" class="esqueceuasenha">Esqueceu a senha?</a>
                   <a href="Registro.aspx" class="esqueceuasenha">Não tenho uma conta.</a>
               </div>
            </div>

            <div class="image-decoration">
                <img src="../Resources/bg-login-01.jpg" />
            </div>
        </div>
    </div>
</div>

</asp:Content>
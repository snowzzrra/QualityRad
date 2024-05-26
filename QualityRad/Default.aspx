<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QualityRad._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .html, body {
            background-color: snow;
        }

        .jumbotron {
            margin-left: 150px;
            background-color: #E9EFF5;
        }

        .row {
            margin-left: 150px;
        }
    </style>
    <div class="jumbotron">
        <h1>Bem-vindo à QualityRad</h1>
        <p class="lead">É com grande entusiasmo que recebemos você em nosso espaço virtual dedicado à excelência na área de diagnóstico por imagem. 
            Aqui na QualityRad, estamos comprometidos em fornecer soluções inovadoras e de alta qualidade para atender às necessidades do setor de saúde, com muita dedicação oferecemos o melhor em gestão de qualidade para o setor de diagnóstico por imagem.</p>
        <p><a href="CadastroClinica.aspx" class="btn btn-primary btn-lg">Cadastre sua clínica aqui &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Equipamentos</h2>
            <p>
                Cadastre e veja o inventário de equipamentos aqui.Mantenha-se atualizado sobre novas adições ao nosso inventário.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Saiba mais &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Empresas terceirizadas</h2>
            <p>
                Ofereça seus serviços como empresa tercerizada. Conheça mais a relação com empresas terceirizadas e saiba como se cadastrar aqui.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Saiba mais &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Entre em contato</h2>
            <p>
                Converse conosco diretamente aqui. Também estamos em várias rede sociais, além de aplicamentos de mensagem como Whatsapp.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Saiba mais &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>

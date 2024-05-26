using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QualityRad.Models
{
    [Serializable]
    public class ClinicaConta
    {
        public int idClinica { get; set; }
        public int idConta { get; set; }

        public ClinicaConta(int IDClinica, int IDConta)
        {
            this.idClinica = IDClinica;
            this.idConta = IDConta;
        }
    }
}
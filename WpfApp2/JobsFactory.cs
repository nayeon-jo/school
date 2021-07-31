using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Documents;
using System.Windows.Input;

namespace JobKind
{
    public class JobsFactory
    {        
        public IEnumerable<Job> FindJobs1(string searchString)
        {
            return jobs.Where(p => p.Ability.Contains(searchString));
        }
        public IEnumerable<Job> FindJobs2(string searchString)
        {
            return jobs.Where(p => p.Interest.Contains(searchString));
        }
        public IEnumerable<Job> FindJobs3(string searchString)
        {
            return jobs.Where(p => p.Check.Contains(searchString));
        }

        #region In-memory data
        // This code builds an in-memory product collection
        // but we could as well fectch it from a database
        // or web service and it would yield the same result.
        static IList<Job> jobs;
        
        static JobsFactory()
        {
            jobs = new List<Job>();
            
            jobs.Add(new Job { Name = "프로그래머", Interest = "IE", Ability = "창의력 수리논리력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "연구원", Interest = "IC", Ability = "수리논리력 언어능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "공무원", Interest = "CS", Ability = "언어능력 자기성찰능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "경찰", Interest = "RS", Ability = "운동능력 자기성찰능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "소설가", Interest = "AC", Ability = "창의력 언어능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "의사", Interest = "IS", Ability = "언어능력 수리논리력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "교사", Interest = "IS", Ability = "언어능력 자기성찰능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "가수", Interest = "AS", Ability = "음악능력 창의력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "외교관", Interest = "EC", Ability = "자기성찰능력 언어능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "조율사", Interest = "AR", Ability = "음악능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "승무원", Interest = "RS", Ability = "언어능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "조종사", Interest = "RI", Ability = "운동능력 수리논리력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "안무가", Interest = "AI", Ability = "운동능력 음악능력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "변호사", Interest = "CS", Ability = "언어능력 수리논리력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "은행원", Interest = "EC", Ability = "언어능력 수리논리력", Memo = "", Check = "" });
            jobs.Add(new Job { Name = "디자이너", Interest = "IA", Ability = "창의력", Memo = "", Check = "" });
        }
        #endregion
    }

    public class Job : Notifier
    {
        private string name;
        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                OnPropertyChanged("Name");
            }
        }

        private string interest;
        public string Interest
        {
            get { return interest; }
            set
            {
                interest = value;
                OnPropertyChanged("Interest");
            }
        }

        private string ability;
        public string Ability
        {
            get { return ability; }
            set
            {
                ability = value;
                OnPropertyChanged("Ability");
            }
        }

        private string memo;
        public string Memo
        {
            get { return memo; }
            set
            {
                memo = value;
                OnPropertyChanged("Memo");
            }
        }

        public string check;
        public string Check
        {
            get { return check; }
            set
            {
                check = value;
                OnPropertyChanged("Check");
            }
        }
    }
}

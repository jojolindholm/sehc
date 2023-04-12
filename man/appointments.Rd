\name{appointments}
\alias{appointments}
\docType{data}

\title{
Appointments
}

\description{
TThis dataset appointments contains one observation per appointment of a high court Justice and includes information on, for example, the appointing cabinet, how long the appointment lasted, and the appointed Justice’s professional background. Note that the same individual may have been appointed multiple times (see also \code{reappointment_order}).
}

\usage{data("appointments")}

\format{
  A data frame with one observation per appointment on the following variables:
  \describe{
    \item{\code{appointment_id}}{A unique identifier for each individual appointment of a high court Justice.}
    \item{\code{judge_id}}{A unique identifier for each individual that has served as a high court Justice.}
    \item{\code{institution_name}}{Name of court that appointee was appointed to.}
    \item{\code{position_president}}{Whether the appointment concerned serving as court president (1) or not (0).}
    \item{\code{position_chamber_chair}}{CWhether the appointment concerned serving as chamber chair (1) or not (0).}
    \item{\code{open_call_number}}{The identifier of the open call to fill the position, where applicable.}
    \item{\code{appointing_cabinet_id}}{ParlGov’s identifier for the appointing cabinet.}
    \item{\code{appointing_cabinet_name}}{ParlGov’s name for the appointing cabinet.}
    \item{\code{appointment_date}}{The date that the government made the appointment.}
    \item{\code{period_start_year}}{The year that the appointee assumed the position.}
    \item{\code{period_end_year}}{The year that the appointee left the appointed position.}
    \item{\code{period_end_date}}{The date that the appointee left the appointed position.}
    \item{\code{reason_leaving}}{The reason why the appointee left the position in question.}
    \item{\code{last_name}}{Appointee's last name.}
    \item{\code{first_name}}{Appointee's first name.}
    \item{\code{middle_name}}{Appointee's middle name.}
    \item{\code{previous_appointments}}{The number of times the appointee has been appointed as a high court Justice prior to the current appointment.}
    \item{\code{female}}{Whether the appointee is female (1) or not (0).}
    \item{\code{birth_year}}{The year the appointee was born.}
    \item{\code{degree_year}}{The year the appointee earned their law degree.}
    \item{\code{degree_university}}{University that the appointee recieved law degree from.}
    \item{\code{acad_lic}}{Recieved licentiate degree.}
    \item{\code{acad_doctor}}{Recieved doctoral degree.}
    \item{\code{acad_lekt}}{Held position as lecturer.}
    \item{\code{acad_docent}}{Held postiion aa associate professor.}
    \item{\code{acad_prof}}{Held postion as professor.}
    \item{\code{dep_spec}}{Held position as specialist at a government ministry.}
    \item{\code{dep_hand}}{Held position as case officer at a government ministry.}
    \item{\code{dep_rad}}{Held position as deputy director-general at a government ministry.}
    \item{\code{dep_chef}}{Held position as executive officer at a government ministry.}
    \item{\code{ct_edu}}{Has completed training to become a judge.}
    \item{\code{ct_tr}}{Has served as a judge at a district court.}
    \item{\code{ct_fr}}{Has served as a judge at an administrative court.}
    \item{\code{ct_hovr}}{Has served as a judge at an appellate court.}
    \item{\code{ct_kamr}}{Has served as a judge at an administrative court of appeal.}
    \item{\code{ct_int}}{Has served as a judge in an international court.}
    \item{\code{ct_other}}{Has served as a judge in some other court.}
    \item{\code{ct_clerk}}{Has served as a clerk in the high courts.}
    \item{\code{priv_assoc}}{Has served as a legal associate in a law firm.}
    \item{\code{priv_adv}}{Has earned the protected title of attorney.}
    \item{\code{priv_corp}}{Has served as a corporate lawyer.}
    \item{\code{pol_empl}}{Has been politically employed in the government office.}
    \item{\code{pol_other}}{Has had some type of partisan assignment.}
    \item{\code{pol_parl}}{Has served as a member of parliament.}
    \item{\code{pol_min}}{Has served as a cabinet minister.}
    \item{\code{publ_amb}}{Has served as ambassador or Consul General to another country or organization.}
    \item{\code{publ_agency}}{Has served at another agency than the government.}
    \item{\code{publ_omb}}{Has served as an ombudsman.}
    \item{\code{publ_pros}}{Has served as a prosecutor.}
    \item{\code{publ_int}}{Has had assignments on behalf of Sweden for international organizations.}
    \item{\code{just_dep}}{Has been employed at the Ministry of Justice.}
    \item{\code{fin_dep}}{Has been employed at the Ministry of Finance.}
    \item{\code{other_dep}}{Has been employed at another ministry.}
    \item{\code{prep_one}}{Has participated in at least one Swedish Government Official Report.}
    \item{\code{prep_multi}}{Has participated in more than five Swedish Government Official Reports.}
    \item{\code{honor_doc}}{Has earned an honorary doctorate in law.}
  }
}
\details{
For more information about the dataset and the variables, download the code book (\url{https://github.com/jojolindholm/sehc/raw/main/sehc_code_book.pdf}).
}
\source{
Based on information extracted from judgments downloaded from the Swedish Naitonal Courts Adminstration's (Domstolsverket) public information system "lagrummet.se" (\url{https://lagrummet.se/lagrummet/English}).
}
\author{
Johan Lindholm, Umeå University, \email{johan.lindholm@umu.se}
}
\references{
%%
}
\examples{
appointments <- appointments |>
  add_government_to_appointments() |>
  add_background_type_to_appointments()
}

\seealso{
  \code{\link{add_government_to_appointments}},
  \code{\link{add_background_type_to_appointments}}
}

\keyword{datasets}

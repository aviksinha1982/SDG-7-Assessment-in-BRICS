require(ggplot2)
'library("cowplot")'

dirname(getwd())
data = read.csv(file = "Book1.csv")

ev <- ggplot(data, aes(Ecosystem.Vulnerability, Country, color=Year)) + geom_point(size = 5) + xlab("Ecosystem Vulnerability") + theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(ev, filename = "cv.ev.png",height = 10, width = 6)

fv <- ggplot(data, aes(Food.Vulnerability, Country, color=Year)) + geom_point(size = 5) + xlab("Food Vulnerability")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(fv, filename = "cv.fv.png",height = 10, width = 6)

helv <- ggplot(data, aes(Health.Vulnerability, Country, color=Year)) + geom_point(size = 5) + xlab("Health Vulnerability")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(helv, filename = "cv.helv.png",height = 10, width = 6)

iv <- ggplot(data, aes(Infrastructure.Vulnerability, Country, color=Year)) + geom_point(size = 5) + xlab("Infrastructure Vulnerability")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(iv, filename = "cv.iv.png",height = 10, width = 6)

wv <- ggplot(data, aes(Water.Vulnerability, Country, color=Year)) + geom_point(size = 5) + xlab("Water Vulnerability")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(wv, filename = "cv.wv.png",height = 10, width = 6)


cc <- ggplot(data, aes(Control.of.Corruption, Country, color=Year)) + geom_point(size = 5) + xlab("Control of Corruption") + theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(cc, filename = "gq.cc.png",height = 10, width = 6)

ge <- ggplot(data, aes(Governance.Effectiveness, Country, color=Year)) + geom_point(size = 5) + xlab("Governance Effectiveness")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(ge, filename = "gq.ge.png",height = 10, width = 6)

ps <- ggplot(data, aes(Political.Stability, Country, color=Year)) + geom_point(size = 5) + xlab("Political Stability")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(ps, filename = "gq.ps.png",height = 10, width = 6)

rq <- ggplot(data, aes(Regulatory.Quality, Country, color=Year)) + geom_point(size = 5) + xlab("Regulatory Quality")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(rq, filename = "gq.rq.png",height = 10, width = 6)

rl <- ggplot(data, aes(Rule.of.Law, Country, color=Year)) + geom_point(size = 5) + xlab("Rule of Law")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(rl, filename = "gq.rl.png",height = 10, width = 6)

va <- ggplot(data, aes(Voice.and.Accountability, Country, color=Year)) + geom_point(size = 5) + xlab("Voice and Accountability")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(va, filename = "gq.va.png",height = 10, width = 6)


sdg711 <- ggplot(data, aes(SDG7.1.1, Country, color=Year)) + geom_point(size = 5) + xlab("SDG 7.1.1")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(sdg711, filename = "sdg711.png",height = 10, width = 6)

sdg712 <- ggplot(data, aes(SDG7.1.2, Country, color=Year)) + geom_point(size = 5) + xlab("SDG 7.1.2")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(sdg712, filename = "sdg712.png",height = 10, width = 6)

sdg721 <- ggplot(data, aes(SDG7.2.1, Country, color=Year)) + geom_point(size = 5) + xlab("SDG 7.2.1")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(sdg721, filename = "sdg721.png",height = 10, width = 6)

sdg731 <- ggplot(data, aes(SDG7.3.1, Country, color=Year)) + geom_point(size = 5) + xlab("SDG 7.3.1")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(sdg731, filename = "sdg731.png",height = 10, width = 6)

'plot_grid(ev, fv, helv, iv, wv, ncol = 6, nrow = 2)'

require(ggplot2)

dirname(getwd())
data = read.csv(file = "Book2.csv")

egpc <- ggplot(data, aes(Electricity.Generation.Per.Capita, Country, color=Year)) + geom_point(size = 5) + xlab("Electricity Generation Per Capita") + theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(egpc, filename = "Electricity.Generation.Per.Capita.png",height = 10, width = 6)

fa <- ggplot(data, aes(Financial.Access, Country, color=Year)) + geom_point(size = 5) + xlab("Financial Access")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(fa, filename = "Financial.Access.png",height = 10, width = 6)

rpg <- ggplot(data, aes(Rural.Population.Growth, Country, color=Year)) + geom_point(size = 5) + xlab("Rural Population Growth")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(rpg, filename = "Rural.Population.Growth.png",height = 10, width = 6)

ie <- ggplot(data, aes(Income.Inequality, Country, color=Year)) + geom_point(size = 5) + xlab("Income Inequality")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(ie, filename = "Income.Inequality.png",height = 10, width = 6)

wv <- ggplot(data, aes(Health.Expenditure, Country, color=Year)) + geom_point(size = 5) + xlab("Health Expenditure")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(wv, filename = "Health.Expenditure.png",height = 10, width = 6)

recg <- ggplot(data, aes(Renewable.Electricity.Generation, Country, color=Year)) + geom_point(size = 5) + xlab("Renewable Electricity Generation") + theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(recg, filename = "Renewable.Electricity.Generation.png",height = 10, width = 6)

ps <- ggplot(data, aes(Policy.Stringency, Country, color=Year)) + geom_point(size = 5) + xlab("Policy Stringency")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(ps, filename = "Policy.Stringency.png",height = 10, width = 6)

pci <- ggplot(data, aes(Per.Capita.Income, Country, color=Year)) + geom_point(size = 5) + xlab("Per Capita Income")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(pci, filename = "Per.Capita.Income.png",height = 10, width = 6)

urpg <- ggplot(data, aes(Urban.Population.Growth, Country, color=Year)) + geom_point(size = 5) + xlab("Urban Population Growth")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(urpg, filename = "Urban.Population.Growth.png",height = 10, width = 6)

inn <- ggplot(data, aes(Environmental.Innovation, Country, color=Year)) + geom_point(size = 5) + xlab("Environmental Innovation")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(inn, filename = "Environmental.Innovation.png",height = 10, width = 6)

fd <- ggplot(data, aes(Financial.Development, Country, color=Year)) + geom_point(size = 5) + xlab("Financial Development")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(fd, filename = "Financial.Development.png",height = 10, width = 6)

nei <- ggplot(data, aes(Net.Energy.Import, Country, color=Year)) + geom_point(size = 5) + xlab("Net Energy Import")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(nei, filename = "Net.Energy.Import.png",height = 10, width = 6)

lctr <- ggplot(data, aes(Low.Carbon.Trade, Country, color=Year)) + geom_point(size = 5) + xlab("Low Carbon Trade")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(lctr, filename = "Low.Carbon.Trade.png",height = 10, width = 6)

fdi <- ggplot(data, aes(Foreign.Direct.Investment, Country, color=Year)) + geom_point(size = 5) + xlab("Foreign Direct Investment")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(fdi, filename = "Foreign.Direct.Investment.png",height = 10, width = 6)

indsh <- ggplot(data, aes(Industrial.Share, Country, color=Year)) + geom_point(size = 5) + xlab("Industrial Share")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(indsh, filename = "Industrial.Share.png",height = 10, width = 6)

ed <- ggplot(data, aes(Energy.Demand, Country, color=Year)) + geom_point(size = 5) + xlab("Energy Demand")+theme(axis.text=element_text(size=10,face="bold"), axis.title.y = element_blank(), legend.position = "right")
ggsave(ed, filename = "Energy.Demand.png",height = 10, width = 6)



install.packages("vars")
install.packages("tseries")
install.packages("lmtest")
install.packages("ggplot2")
install.packages("readxl")
install.packages("urca")
install.packages("car")
library(urca)
library(readxl)
library(lmtest)
library(tseries)
library(vars)
library(readr)
library(car)

data <- read_excel("C:\Users\awebe\OneDrive\Área de Trabalho\Bruna_monografia\conjunto de dados mono (1).xlsx")


############ Renomeando as colunas
names(data) <- c("Data", "markup_jbs", "markup_marfrig", "markup_minerva", "variacao_carne", "boi_gordo", "dummy")

############ Tirando a coluna de data
data_no_date <- (data[-1])

## Combinando vetores

data_no_date_ts <- cbind(data_no_date$markup_minerva, data_no_date$markup_marfrig, data_no_date$markup_jbs, data_no_date$variacao_carne, data_no_date$boi_gordo)

######## Renomeando as colunas de data_no_date_ts
colnames(data_no_date_ts) <- c("markup_jbs", "markup_minerva", "markup_marfrig", "variacao_carne", "boi_gordo")

######## Determinando a ordem

ordem_selecionada <- VARselect(data_no_date_ts, lag.max=3, type="both")$criteria 

print(ordem_selecionada) 

lag_order <- VARselect(data_no_date, lag.max = 3, type = "both")$selection["AIC(n)"]
print(paste("Número ótimo de lags para o VECM (segundo AIC):", lag_order))

######### teste de johansen para identificar co-integração
johansen_test <- ca.jo(data_no_date_ts, type = "trace", ecdet = "none", K = 3)
summary(johansen_test)

# Realizando o teste de correlação entre as variáveis (Teste de Pearson)
correlation_matrix <- cor(data_no_date[, c("markup_minerva", "markup_marfrig", "markup_jbs", "variacao_carne", "boi_gordo")])


print(correlation_matrix)


######## Definindo variaveis exogenas e endogenas, e combinando-as
exogenas <- cbind( data_no_date$dummy, data_no_date$boi_gordo)
endogenas <- cbind(data_no_date$markup_jbs, data_no_date$markup_marfrig, data_no_date$markup_minerva, data_no_date$variacao_carne)

# Nomeando as colunas das variáveis exógenas
colnames(exogenas) <- c(  "dummy","boi_gordo")

# Nomeando as colunas das variáveis endógenas
colnames(endogenas) <- c("markup_jbs", "markup_marfrig", "markup_minerva", "variacao_carne")

################## modelo Vecm
vecm_model <- ca.jo(endogenas, type = "trace", ecdet = "none", K = 3, spec = "longrun", dumvar = exogenas)
vecm_fit <- vecm_fit <- cajorls(vecm_model, r = 2)


summary(vecm_fit$rlm)

# Acessando o vetor de cointegração normalizado
vecm_fit$beta


# Convertendo o modelo VECM para um modelo VAR
var_model_from_vecm <- vec2var(vecm_model)

# Realizando o teste de autocorrelação serial
serial_test_result <- serial.test(var_model_from_vecm, lags.pt = 3, type = "PT.asymptotic")

print(serial_test_result)

# Realizando a análise de resposta ao impulso
irf_results <- irf(var_model_from_vecm, n.ahead = 10, boot = TRUE)


plot(irf_results)

# Realizando a decomposição da variância do erro de previsão
fevd_results <- fevd(var_model_from_vecm, n.ahead = 15)

plot(fevd_results)
print(fevd_results)

SELECT
nome,
    etapa,
        comercial,
            criado_em,
                data_pre_analise,
                    data_vnp_visita,
                        data_visita,
                            data_assinatura,
                                comite,
                                    analise_finalizada,
                                        doc_obrigatorio_para_analise,
                                            vencimento_da_etapa,
                                                timestamp_extracao
FROM "operacoes"."public"."notioncrm"
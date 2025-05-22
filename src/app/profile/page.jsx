"use client";
import React from "react";
import Image from "next/image";
import styles from "./Profile.module.css";
import { Button } from "antd";
import { Skeleton } from 'antd';
import { useState, useEffect } from 'react';

export default function Home() {
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const timer = setTimeout(() => {
      setLoading(false);
    }, 2000); 

    return () => clearTimeout(timer); 
  }, []);

  return (
    
      <main className={styles.main}>
        <Skeleton loading={loading} active>
        <div className={styles.cardProfile}>
          <div className={styles.cardimg}>
            <Image
              className={styles.logo}
              src="/images/profile.jpg"
              alt="Profile picture"
              width={180}
              height={38}
              priority
            />
          </div>

          <div className={styles.cardtext}>
            <h1 className={styles.title}>Evelyn Gonçalves de Oliveira</h1>
            <ul className={styles.list}>
              <li className={styles.subtitle}><span className={styles.negrito}>Turma:</span> TDS1</li>
              <li className={styles.subtitle}><span className={styles.negrito}>Professores:</span> Thiago Ferreira | Marcelo Carboni</li>
              <li className={styles.subtitle}><span className={styles.negrito}>Atividade Avaliativa:</span> Front-end | Cosmetics Store</li>
              <li className={styles.description}>
                Essa é uma atividade de front-end relacionada a API externa da loja de cosméticos. O objetivo é criar uma interface de usuário que consome a API e exibe os produtos disponíveis na loja.
              </li>
            </ul>

            <Button type="primary" >
              Clique aqui para acessar Cosmetics Store - API
            </Button>
          </div>
        </div>
        </Skeleton>
      </main>
    
  );
}

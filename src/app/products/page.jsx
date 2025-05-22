"use client";
import React from "react";
import Image from "next/image";
import styles from "./Profile.module.css";
import { Button } from "antd";
import { Skeleton } from 'antd';
import { useState, useEffect } from 'react';

export default function Products() {
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
                
            </Skeleton>
        </main>
    );

} 
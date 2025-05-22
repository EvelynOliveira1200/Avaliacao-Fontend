import React from 'react';
import styles from './Cards.module.css';
import { Image } from 'next/image';

export default function Cards() {
    return (
        <Image
            className={styles.cardImage}
            src={photo}
            alt="Product image"
            width={180}
            height={180}
            priority
        />

    
      

        
    )
}
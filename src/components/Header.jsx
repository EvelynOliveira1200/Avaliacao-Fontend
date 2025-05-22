import styles from './componentsHeader.module.css'; 
import Image from 'next/image'; 

export default function Headers({ src, alt, text }) {
    return (
        <div className={styles.header}>
            <div className={styles.logo}>
                <Image
                    src={src}
                    alt={alt}
                    width={100}
                    height={100}
                    className={styles.logoImage}
                />
            </div>
            <div className={styles.title}>
                <h1>{text}</h1>
            </div>
        </div>
    );
}
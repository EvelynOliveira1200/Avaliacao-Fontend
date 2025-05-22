import styles from './Cards.module.css'; 
import Image from 'next/image'; 

export default function Cards({ product }) {
    return (
        <div className={styles.card}>
            <Image
                alt={product.name}
                src={
                    product.photo?.startsWith("http") || product.photo?.startsWith("/images")
                        ? product.photo
                        : "/images/220.svg"
                }
                width={220}
                height={220}
                className={styles.cardImage}
            />

            <div className={styles.info}>
                <h2 className={styles.title}><span>Nome: </span>{product.name}</h2>
                <p className={styles.text}><span>Preço: </span>{product.price}</p>
                <p className={styles.text}><span>Categoria: </span>{product.category}</p>
            </div>
        </div>
    );
}
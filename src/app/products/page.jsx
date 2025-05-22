"use client";

import React from "react";
import Image from "next/image";
import axios from "axios";
import styles from "./Product.module.css";
import { Skeleton, Card, Modal, Pagination } from 'antd';
import { useState, useEffect } from 'react';
import { ToastContainer, toast } from 'react-toastify';
import Header from "../../components/Header";

const HEADERS = {
  "x-api-key": process.env.NEXT_PUBLIC_API_KEY || "",
}

export default function Products() {
  const [data, setData] = useState({
    products: [],
    loading: true,
    current: 1,
    pageSize: 5,
  });

  const [modalInfo, setModalInfo] = useState({
    visible: false,
    product: null,
  });

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const { data: products } = await axios.get(
          `${process.env.NEXT_PUBLIC_API_URL}/products`,
          { headers: HEADERS }
        );
        setData((prev) => ({ ...prev, products, loading: false }));
      } catch (error) {
        toast.error("Erro ao carregar produtos");
        setData((prev) => ({ ...prev, loading: false }));
      }
    };

    fetchProducts();
  }, []);

  const openModal = (product) => {
    setModalInfo({
      visible: true,
      product,
    });
  };

  const closeModal = () => {
    setModalInfo({
      visible: false,
      product: null,
    });
  };

  const paginatedProducts = () => {
    const start = (data.current - 1) * data.pageSize;
    return data.products.slice(start, start + data.pageSize);
  };

  const handleCardClick = (name) => {
    toast.info(`Você clicou no: ${name}`, {});
  };

  return (
    <main className={styles.main}>
      <Skeleton loading={data.loading} active>

        <Header
          src="/images/logo.jpg"
          alt="Logo"
          text="Cosmetics Store | Lista de Produtos"
        />

        {data.loading ? (
          <Image
            src="/media/loading.gif"
            alt="Loading"
            width={300}
            height={200}
          />
        ) : (
          <div className={styles.cardContainer}>
            {paginatedProducts().map((product) => (
              <Card
                key={product.id}
                className={styles.card}
                hoverable
                onClick={() => {
                  openModal(product);
                  handleCardClick(product.name);
                }}
                style={{ width: 220, margin: "10px" }}
                cover={
                  <Image
                    alt={product.name}
                    src={
                      product.photo?.startsWith("http")
                        ? product.photo
                        : product.photo?.startsWith("/images")
                        ? product.photo
                        : product.photo
                        ? `http://localhost:3000/uploads/${product.photo}`
                        : "/images/220.svg"
                    }
                    width={220}
                    height={220}
                  />
                }
              >
                <Card.Meta
                  title={product.name}
                  description={
                    <p>
                      <strong>Categoria:</strong> {product.category_name || "N/A"}
                    </p>
                  }
                />
              </Card>
            ))}
          </div>
        )}

        <Modal
          title={`Detalhes do produto`}
          open={modalInfo.visible}
          onCancel={closeModal}
          onOk={closeModal}
          width={600}
        >
          {modalInfo.product ? (
            <div className={styles.categorysInfo}>
              <p>
                <span className={styles.label}>Nome:</span> {modalInfo.product.name}
              </p>
              <p>
                <span className={styles.label}>Preço:</span> R$ {modalInfo.product.price_product}
              </p>
              <p>
                <span className={styles.label}>Categoria:</span>{" "}
                {modalInfo.product.category_name || "N/A"}
              </p>
            </div>
          ) : (
            <Skeleton active />
          )}
        </Modal>

        <Pagination
          current={data.current}
          pageSize={data.pageSize}
          total={data.products.length}
          onChange={(page, size) =>
            setData((prev) => ({ ...prev, current: page, pageSize: size }))
          }
          showSizeChanger
          pageSizeOptions={["5", "10", "100"]}
        />
        
        <ToastContainer position="top-right" autoClose={4500} />
      </Skeleton>
    </main>
  );
}

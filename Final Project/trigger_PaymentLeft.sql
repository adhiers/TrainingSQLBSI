DELIMITER $$

CREATE TRIGGER trg_update_payment_left
AFTER INSERT ON PaymentHistory
FOR EACH ROW
BEGIN
    DECLARE totalPaid FLOAT DEFAULT 0;
    DECLARE totalCredit FLOAT DEFAULT 0;

    -- Ambil total kredit dari tabel Credit melalui Agreement
    SELECT c.NominalKredit
    INTO totalCredit
    FROM Agreement a
    JOIN Credit c ON a.CreditId = c.CreditId
    WHERE a.AgreementId = NEW.AgreementId;

    -- Hitung total pembayaran untuk agreement yang sama
    SELECT SUM(Nominal)
    INTO totalPaid
    FROM PaymentHistory
    WHERE AgreementId = NEW.AgreementId;

    -- Update kolom PaymentLeft pada baris terakhir yang baru dimasukkan
    UPDATE PaymentHistory
    SET PaymentLeft = totalCredit - totalPaid
    WHERE PaymentId = NEW.PaymentId;
END$$

DELIMITER ;
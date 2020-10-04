//
// Generated file, do not edit! Created by nedtool 5.5 from DynaPacket.msg.
//

#ifndef __DYNAPACKET_M_H
#define __DYNAPACKET_M_H

#if defined(__clang__)
#  pragma clang diagnostic ignored "-Wreserved-id-macro"
#endif
#include <omnetpp.h>

// nedtool version check
#define MSGC_VERSION 0x0505
#if (MSGC_VERSION!=OMNETPP_VERSION)
#    error Version mismatch! Probably this file was generated by an earlier version of nedtool: 'make clean' should help.
#endif



class DynaPacket;
class DynaDataPacket;
/**
 * Enum generated from <tt>DynaPacket.msg:12</tt> by nedtool.
 * <pre>
 * enum DynaPacketType
 * {
 *     DYNA_CONN_REQ = 0;
 *     DYNA_CONN_ACK = 1;
 *     DYNA_DISC_REQ = 2;
 *     DYNA_DISC_ACK = 3;
 *     DYNA_DATA = 4;
 * }
 * </pre>
 */
enum DynaPacketType {
    DYNA_CONN_REQ = 0,
    DYNA_CONN_ACK = 1,
    DYNA_DISC_REQ = 2,
    DYNA_DISC_ACK = 3,
    DYNA_DATA = 4
};

/**
 * Class generated from <tt>DynaPacket.msg:21</tt> by nedtool.
 * <pre>
 * packet DynaPacket
 * {
 *     int srcAddress;
 *     int destAddress;
 *     int serverProcId;
 * }
 * </pre>
 */
class DynaPacket : public ::omnetpp::cPacket
{
  protected:
    int srcAddress = 0;
    int destAddress = 0;
    int serverProcId = 0;

  private:
    void copy(const DynaPacket& other);

  protected:
    // protected and unimplemented operator==(), to prevent accidental usage
    bool operator==(const DynaPacket&);

  public:
    DynaPacket(const char *name=nullptr, short kind=0);
    DynaPacket(const DynaPacket& other);
    virtual ~DynaPacket();
    DynaPacket& operator=(const DynaPacket& other);
    virtual DynaPacket *dup() const override {return new DynaPacket(*this);}
    virtual void parsimPack(omnetpp::cCommBuffer *b) const override;
    virtual void parsimUnpack(omnetpp::cCommBuffer *b) override;

    // field getter/setter methods
    virtual int getSrcAddress() const;
    virtual void setSrcAddress(int srcAddress);
    virtual int getDestAddress() const;
    virtual void setDestAddress(int destAddress);
    virtual int getServerProcId() const;
    virtual void setServerProcId(int serverProcId);
};

inline void doParsimPacking(omnetpp::cCommBuffer *b, const DynaPacket& obj) {obj.parsimPack(b);}
inline void doParsimUnpacking(omnetpp::cCommBuffer *b, DynaPacket& obj) {obj.parsimUnpack(b);}

/**
 * Class generated from <tt>DynaPacket.msg:28</tt> by nedtool.
 * <pre>
 * packet DynaDataPacket extends DynaPacket
 * {
 *     string payload;
 * }
 * </pre>
 */
class DynaDataPacket : public ::DynaPacket
{
  protected:
    omnetpp::opp_string payload;

  private:
    void copy(const DynaDataPacket& other);

  protected:
    // protected and unimplemented operator==(), to prevent accidental usage
    bool operator==(const DynaDataPacket&);

  public:
    DynaDataPacket(const char *name=nullptr, short kind=0);
    DynaDataPacket(const DynaDataPacket& other);
    virtual ~DynaDataPacket();
    DynaDataPacket& operator=(const DynaDataPacket& other);
    virtual DynaDataPacket *dup() const override {return new DynaDataPacket(*this);}
    virtual void parsimPack(omnetpp::cCommBuffer *b) const override;
    virtual void parsimUnpack(omnetpp::cCommBuffer *b) override;

    // field getter/setter methods
    virtual const char * getPayload() const;
    virtual void setPayload(const char * payload);
};

inline void doParsimPacking(omnetpp::cCommBuffer *b, const DynaDataPacket& obj) {obj.parsimPack(b);}
inline void doParsimUnpacking(omnetpp::cCommBuffer *b, DynaDataPacket& obj) {obj.parsimUnpack(b);}

#endif // ifndef __DYNAPACKET_M_H

